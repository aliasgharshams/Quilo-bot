<?php

require_once __DIR__ . "/../../database/database.php";

class User
{
    private static $db;


    private static function db()
    {
        if (!self::$db) {
            self::$db = Database::connect();
        }

        return self::$db;
    }


    public static function find($telegram_id)
    {
        $stmt = self::db()->prepare(
            "SELECT * FROM users WHERE telegram_id = ? LIMIT 1"
        );

        $stmt->execute([$telegram_id]);

        return $stmt->fetch(PDO::FETCH_ASSOC);
    }


    public static function create($data)
    {
        $stmt = self::db()->prepare(
            "INSERT INTO users
            (telegram_id, username, first_name, last_name)
            VALUES (?, ?, ?, ?)"
        );

        return $stmt->execute([
            $data["telegram_id"],
            $data["username"] ?? null,
            $data["first_name"] ?? null,
            $data["last_name"] ?? null
        ]);
    }
}
