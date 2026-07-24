<?php

error_reporting(E_ALL);
ini_set('display_errors', 1);


require_once __DIR__ . "/../app/bot/core/Telegram.php";
require_once __DIR__ . "/../app/bot/core/Router.php";
require_once __DIR__ . "/../app/bot/core/Admin.php";


require_once __DIR__ . "/../app/bot/keyboards/AdminKeyboard.php";
require_once __DIR__ . "/../app/bot/keyboards/MainKeyboard.php";
require_once __DIR__ . "/../app/bot/handlers/AddPanelHandler.php";
require_once __DIR__ . "/../app/bot/handlers/AdminHandler.php";
require_once __DIR__ . "/../app/bot/handlers/StatsHandler.php";
require_once __DIR__ . "/../app/bot/handlers/StartHandler.php";
require_once __DIR__ . "/../app/bot/handlers/MenuHandler.php";
require_once __DIR__ . "/../app/bot/handlers/ShopHandler.php";



$update = json_decode(
    file_get_contents("php://input"),
    true
);



$telegram = new Telegram();

$router = new Router();



$router->add(
    "/start",
    function($update){

        return StartHandler::handle($update);

    }
);



$router->add(
    "🛒 خرید سرویس",
    function($update){

        return ShopHandler::show();

    }
);



$router->add(
    "📦 سرویس‌های من",
    function($update){

        return MenuHandler::handle($update);

    }
);



$router->add(
    "💳 کیف پول",
    function($update){

        return MenuHandler::handle($update);

    }
);



$router->add(
    "🎁 کد تخفیف",
    function($update){

        return MenuHandler::handle($update);

    }
);



$router->add(
    "👤 حساب کاربری",
    function($update){

        return MenuHandler::handle($update);

    }
);



$router->add(
    "🆘 پشتیبانی",
    function($update){

        return MenuHandler::handle($update);

    }
);



$router->add(
    "👨‍💻 پنل مدیریت",
    function($update){

        return AdminHandler::open($update);

    }
);



$router->add(
    "📊 آمار ربات",
    function($update){

        $result = StatsHandler::show($update);

        $result["stats"] = true;

        return $result;

    }
);



$router->add(
    "🏠 بازگشت به پنل مدیریت",
    function($update){

        return AdminHandler::open($update);

    }
);

$router->add(
    "🖥 اضافه کردن پنل",
    function($update){

        return AddPanelHandler::start($update);

    }
);


$admin_buttons = [

    "🖥 اضافه کردن پنل",
    "✏️ مدیریت پنل",
    "🔋 تنظیم سریع قیمت حجم",
    "⏳ تنظیم سریع قیمت زمان",
    "👤 مدیریت کاربران",
    "🏢 تنظیمات فروشگاه",
    "💎 مالی",
    "📚 بخش آموزش",
    "👍 بخش پشتیبانی",
    "🛠 قابلیت های پنل",
    "💸 رسید های تایید نشده",
    "📮 گزارش ربات",
    "⚙️ تنظیمات عمومی",
    "📝 ویرایش متن‌های ربات"

];



foreach($admin_buttons as $button){

    $router->add(
        $button,
        function($update) use ($button){

            return [

                "text"=>$button."\n\nدر حال ساخت...",

                "keyboard"=>AdminKeyboard::get()

            ];

        }
    );

}



$router->add(
    "🏠 بازگشت به منوی اصلی",
    function($update){

        return [

            "text"=>"بازگشت به منوی اصلی",

            "keyboard"=>MainKeyboard::get(
                $update["message"]["chat"]["id"]
            )

        ];

    }
);



$result = $router->dispatch($update);



if($result){


    $chat_id =
    $update["message"]["chat"]["id"];



    $telegram->sendMessage(

        $chat_id,

        $result["text"],

        $result["keyboard"] ?? null

    );



    if(isset($result["stats"]) && $result["stats"] === true){


$telegram->sendMessage(

    $chat_id,

    "برای برگشت به پنل مدیریت 👇",

    [

        "keyboard"=>[

            [

                [
                    "text"=>"🏠 بازگشت به پنل مدیریت"
                ]

            ]

        ],

        "resize_keyboard"=>true

    ]

);

    }

}



http_response_code(200);
