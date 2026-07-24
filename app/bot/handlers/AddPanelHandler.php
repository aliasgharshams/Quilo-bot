<?php

require_once __DIR__ . "/../core/State.php";
require_once __DIR__ . "/../keyboards/AdminKeyboard.php";


class AddPanelHandler
{


    public static function start($update)
    {

        $telegram_id =
        $update["message"]["chat"]["id"];



        State::set(
            $telegram_id,
            "panel_type",
            []
        );



        return [

            "text" =>
"🖥 <b>اضافه کردن پنل</b>

نوع پنل را انتخاب کنید:",


            "keyboard"=>[

                "keyboard"=>[

                    [

                        [
                            "text"=>"Marzban"
                        ],

                        [
                            "text"=>"X-UI"
                        ]

                    ],

                    [

                        [
                            "text"=>"❌ لغو"
                        ]

                    ]

                ],

                "resize_keyboard"=>true

            ]

        ];

    }


}

