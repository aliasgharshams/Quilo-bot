<?php

require_once __DIR__ . "/../core/Statistics.php";


class StatsHandler
{

    public static function show($update)
    {

        $users = Statistics::users();
        $orders = Statistics::orders();
        $services = Statistics::services();
        $panels = Statistics::panels();
        $payments = Statistics::payments();


        $text =
"📊 <b>آمار کلی ربات</b>

━━━━━━━━━━━━━━

👥 <b>تعداد کل کاربران:</b> {$users["total"]} نفر
💳 <b>کاربران دارای خرید:</b> {$orders["success"]} نفر
🧪 <b>اکانت‌های تست:</b> {$services["total"]} نفر

💰 <b>موجودی کل کاربران:</b> {$users["balance"]} تومان


🧾 <b>تعداد کل فروش:</b> {$orders["total"]} عدد
📄 <b>تعداد فروش سرویس‌های فعال:</b> {$services["active"]} عدد

💵 <b>جمع کل فروش:</b> {$orders["amount"]} تومان
💵 <b>جمع فروش سرویس‌های فعال:</b> {$orders["amount"]} تومان

🔄 <b>جمع کل تمدید:</b> 0 تومان

📈 <b>نرخ تبدیل به مشتری:</b> 0٪

💳 <b>میانگین خرید هر مشتری:</b> 0 تومان

📅 <b>آخرین سرویس معامله شده:</b> 0 تومان


👨‍💼 <b>تعداد کل نمایندگان:</b> 0 نفر

🔷 <b>نمایندگان نوع N1:</b> 0 نفر
🔶 <b>نمایندگان نوع N2:</b> 0 نفر

🧩 <b>تعداد پنل‌ها:</b> {$panels["total"]}


📌 <b>نام درگاه:</b> کارت به کارت

- تعداد پرداخت موفق: {$payments["total"]}
- جمع پرداختی‌ها: {$payments["amount"]} تومان";



        $keyboard = [

            [
                [
                    "text"=>"📊 آمار کل",
                    "callback_data"=>"stats_all"
                ]
            ],

            [
                [
                    "text"=>"⏱ یک ساعت اخیر",
                    "callback_data"=>"stats_hour"
                ]
            ],

            [
                [
                    "text"=>"☁️ امروز",
                    "callback_data"=>"stats_today"
                ],
                [
                    "text"=>"☀️ دیروز",
                    "callback_data"=>"stats_yesterday"
                ]
            ],

            [
                [
                    "text"=>"☀️ ماه فعلی",
                    "callback_data"=>"stats_month"
                ],
                [
                    "text"=>"☁️ ماه قبل",
                    "callback_data"=>"stats_last_month"
                ]
            ],

            [
                [
                    "text"=>"🗓 مشاهده آمار در تاریخ مشخص",
                    "callback_data"=>"stats_date"
                ]
            ],

        ];



        return [

            "text"=>$text,

            "keyboard"=>[
                "inline_keyboard"=>$keyboard
            ]

        ];

    }

}
