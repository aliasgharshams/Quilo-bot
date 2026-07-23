<?php

require_once __DIR__ . "/../../database/database.php";


class ShopHandler
{

    public static function products()
    {

        $pdo = Database::connect();


        $stmt = $pdo->query(
            "SELECT * FROM products WHERE status=1"
        );


        return $stmt->fetchAll(PDO::FETCH_ASSOC);

    }


    public static function show()
    {

        $products = self::products();


        $text = "🛒 سرویس‌های موجود:\n\n";


        foreach($products as $product){

            $text .=
            "🔹 ".$product["name"]."\n".
            "💾 حجم: ".$product["volume"]." گیگ\n".
            "⏳ مدت: ".$product["duration"]." روز\n".
            "💰 قیمت: ".$product["price"]." تومان\n\n";

        }


        return [
            "text"=>$text,
            "keyboard"=>MainKeyboard::get()
        ];

    }


}
