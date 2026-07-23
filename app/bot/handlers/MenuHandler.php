<?php


class MenuHandler
{


    public static function handle($update)
    {

        $text = $update["message"]["text"];


        switch($text){


            case "🛒 خرید سرویس":

                return [
                    "text"=>"🛒 بخش خرید سرویس\n\nلطفاً سرویس مورد نظر خود را انتخاب کنید.",
                    "keyboard"=>MainKeyboard::get()
                ];


            case "📦 سرویس‌های من":

                return [
                    "text"=>"📦 شما هنوز سرویسی ندارید.",
                    "keyboard"=>MainKeyboard::get()
                ];


            case "💳 کیف پول":

                return [
                    "text"=>"💳 موجودی کیف پول شما: 0 تومان",
                    "keyboard"=>MainKeyboard::get()
                ];


            case "🎁 کد تخفیف":

                return [
                    "text"=>"🎁 کد تخفیف خود را ارسال کنید.",
                    "keyboard"=>MainKeyboard::get()
                ];


            case "👤 حساب کاربری":

                return [
                    "text"=>"👤 اطلاعات حساب کاربری شما",
                    "keyboard"=>MainKeyboard::get()
                ];


            case "🆘 پشتیبانی":

                return [
                    "text"=>"🆘 برای ارتباط با پشتیبانی پیام خود را ارسال کنید.",
                    "keyboard"=>MainKeyboard::get()
                ];

        }


        return null;

    }


}
