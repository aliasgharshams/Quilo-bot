<?php

require_once __DIR__ . "/../core/Statistics.php";
require_once __DIR__ . "/../keyboards/AdminKeyboard.php";


class StatsHandler
{


    public static function show($update)
    {

        $users = Statistics::users();

        $orders = Statistics::orders();

        $services = Statistics::services();

        $panels = Statistics::panels();

        $products = Statistics::products();



        $text =
"📊 آمار کلی ربات


👥 کاربران

👤 کل کاربران: {$users["total"]}
🆕 ثبت نام امروز: {$users["today"]}
💰 مجموع موجودی: {$users["balance"]}


🛒 فروش

🧾 تعداد سفارش‌ها: {$orders["total"]}
✅ سفارش موفق: {$orders["paid"]}


📦 سرویس‌ها

📌 کل سرویس‌ها: {$services["total"]}
🟢 سرویس فعال: {$services["active"]}


🖥 پنل‌ها

🧩 تعداد پنل‌ها: {$panels}


🛍 محصولات

📦 تعداد محصولات: {$products}";


        return [

            "text"=>$text,

            "keyboard"=>AdminKeyboard::get()

        ];

    }


}
