<?php

require_once __DIR__ . "/../core/Statistics.php";
require_once __DIR__ . "/../keyboards/AdminKeyboard.php";


class StatsHandler
{


    public static function show($update)
    {


        $users = Statistics::users();

        $sales = Statistics::sales();

        $payments = Statistics::payments();

        $services = Statistics::services();

        $panels = Statistics::panels();



        $text =
"📊 آمار کلی ربات


👥 کاربران

👤 کل کاربران: {$users["total"]}
🆕 ثبت نام امروز: {$users["today"]}
💰 مجموع موجودی: {$users["balance"]}


🛒 فروش

🧾 تعداد سفارش‌ها: {$sales["total"]}
✅ فروش موفق: {$sales["success"]}
💵 مبلغ فروش: {$sales["amount"]}


💳 پرداخت‌ها

✅ پرداخت موفق: {$payments["count"]}
💰 مجموع پرداختی: {$payments["amount"]}


📦 سرویس‌ها

📌 کل سرویس‌ها: {$services["total"]}
🟢 سرویس فعال: {$services["active"]}


🖥 پنل‌ها

🧩 کل پنل‌ها: {$panels["total"]}
🟢 پنل فعال: {$panels["active"]}";



        return [

            "text"=>$text,

            "keyboard"=>AdminKeyboard::get()

        ];

    }


}
