<?php

require_once __DIR__ . "/../core/Statistics.php";
require_once __DIR__ . "/../keyboards/AdminKeyboard.php";


class StatsHandler
{


    public static function show($update)
    {

        $users = Statistics::users();

        $orders = Statistics::orders();

        $today = Statistics::todaySales();

        $month = Statistics::monthSales();

        $services = Statistics::services();

        $expire = Statistics::expiringServices();

        $panels = Statistics::panels();

        $products = Statistics::products();

        $payments = Statistics::payments();



        $text =
"📊 آمار کلی ربات


👥 کاربران

👤 کل کاربران: {$users["total"]}
🆕 ثبت‌نام امروز: {$users["today"]}
💰 مجموع موجودی: {$users["balance"]}


🛒 فروش

🧾 کل فروش‌ها: {$orders["total"]}
✅ فروش موفق: {$orders["success"]}
💵 مبلغ کل فروش: {$orders["amount"]}

📅 فروش امروز:
🧾 تعداد: {$today["count"]}
💰 مبلغ: {$today["amount"]}

📆 فروش ماه جاری:
🧾 تعداد: {$month["count"]}
💰 مبلغ: {$month["amount"]}


💳 پرداخت‌ها

💳 تعداد پرداخت: {$payments["total"]}
💰 مجموع پرداخت: {$payments["amount"]}


📦 سرویس‌ها

📌 کل سرویس: {$services["total"]}
🟢 فعال: {$services["active"]}
⏳ نزدیک انقضا (۷ روز): {$expire}


🖥 پنل‌ها

🧩 کل پنل‌ها: {$panels["total"]}
🟢 فعال: {$panels["active"]}


🛍 محصولات

📦 کل محصولات: {$products["total"]}
🟢 فعال: {$products["active"]}";



        return [

            "text"=>$text,

            "keyboard"=>AdminKeyboard::get()

        ];

    }


}
