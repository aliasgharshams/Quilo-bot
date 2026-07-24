<?php

require_once __DIR__ . "/../core/User.php";

class StatsHandler
{

    public static function show($update)
    {

        return [

            "text" =>
            "📊 آمار ربات\n\n".
            "👤 کاربران کل: ".User::count()."\n".
            "🆕 کاربران امروز: ".User::todayCount()."\n".
            "💰 مجموع موجودی: ".User::totalBalance()

        ];

    }

}
