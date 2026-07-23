<?php

class Database
{

    private static $pdo;


    public static function connect()
    {

        if (!self::$pdo) {

            $config = require __DIR__ . "/../config/config.php";


            self::$pdo = new PDO(

                "mysql:host=".$config["db"]["host"].
                ";dbname=".$config["db"]["name"].
                ";charset=utf8mb4",

                $config["db"]["user"],

                $config["db"]["pass"]

            );


            self::$pdo->setAttribute(
                PDO::ATTR_ERRMODE,
                PDO::ERRMODE_EXCEPTION
            );

        }


        return self::$pdo;

    }

}
