<?php

error_reporting(E_ALL);
ini_set('display_errors', 1);

require_once __DIR__ .
"/../app/bot/core/Telegram.php";


require_once __DIR__ .
"/../app/bot/core/Router.php";


require_once __DIR__ .
"/../app/bot/core/Admin.php";

require_once __DIR__ .
"/../app/bot/keyboards/AdminKeyboard.php";

require_once __DIR__ .
"/../app/bot/handlers/AdminHandler.php";

require_once __DIR__ .
"/../app/bot/handlers/StatsHandler.php";

require_once __DIR__ .
"/../app/bot/handlers/StartHandler.php";

require_once __DIR__ .
"/../app/bot/handlers/MenuHandler.php";

require_once __DIR__ .
"/../app/bot/handlers/ShopHandler.php";

$update =
json_decode(
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
    "📊 آمار ربات",
    function($update){

        return StatsHandler::show($update);

    }
);


$router->add(
    "🖥 اضافه کردن پنل",
    function($update){

        return [
            "text"=>"🖥 اضافه کردن پنل

در حال ساخت...",
            "keyboard"=>AdminKeyboard::get()
        ];

    }
);


$router->add(
    "✏️ مدیریت پنل",
    function($update){

        return [
            "text"=>"✏️ مدیریت پنل

در حال ساخت...",
            "keyboard"=>AdminKeyboard::get()
        ];

    }
);


$router->add(
    "🔋 تنظیم سریع قیمت حجم",
    function($update){

        return [
            "text"=>"🔋 تنظیم سریع قیمت حجم

در حال ساخت...",
            "keyboard"=>AdminKeyboard::get()
        ];

    }
);


$router->add(
    "⏳ تنظیم سریع قیمت زمان",
    function($update){

        return [
            "text"=>"⏳ تنظیم سریع قیمت زمان

در حال ساخت...",
            "keyboard"=>AdminKeyboard::get()
        ];

    }
);


$router->add(
    "👤 مدیریت کاربران",
    function($update){

        return [
            "text"=>"👤 مدیریت کاربران

در حال ساخت...",
            "keyboard"=>AdminKeyboard::get()
        ];

    }
);


$router->add(
    "🏢 تنظیمات فروشگاه",
    function($update){

        return [
            "text"=>"🏢 تنظیمات فروشگاه

در حال ساخت...",
            "keyboard"=>AdminKeyboard::get()
        ];

    }
);


$router->add(
    "💎 مالی",
    function($update){

        return [
            "text"=>"💎 بخش مالی

در حال ساخت...",
            "keyboard"=>AdminKeyboard::get()
        ];

    }
);


$router->add(
    "📚 بخش آموزش",
    function($update){

        return [
            "text"=>"📚 بخش آموزش

در حال ساخت...",
            "keyboard"=>AdminKeyboard::get()
        ];

    }
);


$router->add(
    "👍 بخش پشتیبانی",
    function($update){

        return [
            "text"=>"👍 بخش پشتیبانی

در حال ساخت...",
            "keyboard"=>AdminKeyboard::get()
        ];

    }
);


$router->add(
    "🛠 قابلیت های پنل",
    function($update){

        return [
            "text"=>"🛠 قابلیت های پنل

در حال ساخت...",
            "keyboard"=>AdminKeyboard::get()
        ];

    }
);


$router->add(
    "💸 رسید های تایید نشده",
    function($update){

        return [
            "text"=>"💸 رسید های تایید نشده

در حال ساخت...",
            "keyboard"=>AdminKeyboard::get()
        ];

    }
);


$router->add(
    "📮 گزارش ربات",
    function($update){

        return [
            "text"=>"📮 گزارش ربات

در حال ساخت...",
            "keyboard"=>AdminKeyboard::get()
        ];

    }
);


$router->add(
    "⚙️ تنظیمات عمومی",
    function($update){

        return [
            "text"=>"⚙️ تنظیمات عمومی

در حال ساخت...",
            "keyboard"=>AdminKeyboard::get()
        ];

    }
);


$router->add(
    "📝 ویرایش متن‌های ربات",
    function($update){

        return [
            "text"=>"📝 ویرایش متن‌های ربات

در حال ساخت...",
            "keyboard"=>AdminKeyboard::get()
        ];

    }
);


$router->add(
    "🏠 بازگشت به منوی اصلی",
    function($update){

        return [
            "text"=>"بازگشت به منوی اصلی",
            "keyboard"=>MainKeyboard::get($update["message"]["chat"]["id"])
        ];

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


$result =
$router->dispatch($update);


if($result){


    $telegram->sendMessage(

        $update["message"]["chat"]["id"],

        $result["text"],

        $result["keyboard"]

    );

}



http_response_code(200);
