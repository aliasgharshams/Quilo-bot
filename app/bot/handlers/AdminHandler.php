<?php


require_once __DIR__ .
"/../keyboards/AdminKeyboard.php";


class AdminHandler
{


    public static function open($update)
    {

        $chat_id =
        $update["message"]["chat"]["id"] ?? null;


        if(!$chat_id){

            return null;

        }


        return [

            "text"=>"⚙️ پنل مدیریت",

            "keyboard"=>AdminKeyboard::get()

        ];

    }


}
