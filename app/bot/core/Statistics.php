<?php

require_once __DIR__ . "/../../database/database.php";


class Statistics
{

    private static $db;


    private static function db()
    {
        if (!self::$db) {

            self::$db = Database::connect();

        }

        return self::$db;
    }



    public static function users()
    {

        $db = self::db();


        return [

            "total" => $db->query(
                "SELECT COUNT(*) FROM users"
            )->fetchColumn(),


            "today" => $db->query(
                "SELECT COUNT(*) FROM users WHERE DATE(created_at)=CURDATE()"
            )->fetchColumn(),


            "balance" => $db->query(
                "SELECT COALESCE(SUM(balance),0) FROM users"
            )->fetchColumn()

        ];

    }



    public static function sales()
    {

        $db = self::db();


        return [

            "total" => $db->query(
                "SELECT COUNT(*) FROM orders"
            )->fetchColumn(),


            "success" => $db->query(
                "SELECT COUNT(*) FROM orders WHERE status='completed'"
            )->fetchColumn(),


            "amount" => $db->query(
                "SELECT COALESCE(SUM(amount),0) FROM orders WHERE status='completed'"
            )->fetchColumn()

        ];

    }



    public static function payments()
    {

        $db = self::db();


        return [

            "count" => $db->query(
                "SELECT COUNT(*) FROM payments WHERE status='completed'"
            )->fetchColumn(),


            "amount" => $db->query(
                "SELECT COALESCE(SUM(amount),0) FROM payments WHERE status='completed'"
            )->fetchColumn()

        ];

    }



    public static function services()
    {

        $db = self::db();


        return [

            "total" => $db->query(
                "SELECT COUNT(*) FROM vpn_accounts"
            )->fetchColumn(),


            "active" => $db->query(
                "SELECT COUNT(*) FROM vpn_accounts WHERE status='active'"
            )->fetchColumn()

        ];

    }



    public static function panels()
    {

        $db = self::db();


        return [

            "total" => $db->query(
                "SELECT COUNT(*) FROM vpn_panels"
            )->fetchColumn(),


            "active" => $db->query(
                "SELECT COUNT(*) FROM vpn_panels WHERE active=1"
            )->fetchColumn()

        ];

    }


}
