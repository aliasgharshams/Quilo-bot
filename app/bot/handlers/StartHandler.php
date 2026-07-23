<?php


require_once __DIR__ .
"/../keyboards/MainKeyboard.php";

require_once __DIR__ .
"/../core/User.php";


class StartHandler
{


    public static function handle($update)
    {


        $message =
        $update["message"];


        $telegram_id =
        $message["chat"]["id"];



        $user = User::find(
            $telegram_id
        );


        if(!$user){

            User::create([

                "telegram_id"=>$telegram_id,

                "username"=>
                $message["chat"]["username"] ?? null,

                "first_name"=>
                $message["chat"]["first_name"] ?? null,

                "last_name"=>
                $message["chat"]["last_name"] ?? null

            ]);

        }



        return [

            "text" =>
            "سلام 👋

به Quilo-bot خوش آمدید.",


             "keyboard" =>
MainKeyboard::get(8668159136)

        ];

    }


}
