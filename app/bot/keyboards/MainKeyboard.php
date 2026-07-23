<?php


require_once __DIR__ .
"/../core/Admin.php";


class MainKeyboard
{


    public static function get($telegram_id = null)
    {


        $keyboard = [

            [
                [
                    "text"=>"🛒 خرید سرویس"
                ],
                [
                    "text"=>"📦 سرویس‌های من"
                ]
            ],

            [
                [
                    "text"=>"💳 کیف پول"
                ],
                [
                    "text"=>"🎁 کد تخفیف"
                ]
            ],

            [
                [
                    "text"=>"👤 حساب کاربری"
                ],
                [
                    "text"=>"🆘 پشتیبانی"
                ]
            ]

        ];


        if($telegram_id !== null && Admin::isAdmin($telegram_id))
        {

            $keyboard[] = [

                [
                    "text"=>"👨‍💻 پنل مدیریت"
                ]

            ];

        }


        return [

            "keyboard"=>$keyboard,

            "resize_keyboard"=>true

        ];

    }


}
