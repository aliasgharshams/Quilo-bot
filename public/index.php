<?php


require_once __DIR__ .
"/../app/bot/core/Telegram.php";


require_once __DIR__ .
"/../app/bot/core/Router.php";


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
