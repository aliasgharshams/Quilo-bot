<?php

require_once __DIR__ . "/../../database/database.php";


class State
{

    private static $db;



    private static function db()
    {

        if(!self::$db){

            self::$db = Database::connect();

        }


        return self::$db;

    }




    public static function set($telegram_id, $step, $data = null)
    {

        $stmt = self::db()->prepare(

            "INSERT INTO bot_states
            (telegram_id, step, data)

            VALUES (?, ?, ?)

            ON DUPLICATE KEY UPDATE

            step = VALUES(step),
            data = VALUES(data)"

        );


        return $stmt->execute([

            $telegram_id,

            $step,

            $data ? json_encode($data) : null

        ]);

    }





    public static function get($telegram_id)
    {

        $stmt = self::db()->prepare(

            "SELECT * FROM bot_states
            WHERE telegram_id = ?
            LIMIT 1"

        );


        $stmt->execute([

            $telegram_id

        ]);


        $state = $stmt->fetch(PDO::FETCH_ASSOC);



        if(!$state){

            return null;

        }



        return [

            "step"=>$state["step"],

            "data"=>
            $state["data"]
            ?
            json_decode($state["data"], true)
            :
            []

        ];

    }






    public static function clear($telegram_id)
    {

        $stmt = self::db()->prepare(

            "DELETE FROM bot_states
            WHERE telegram_id = ?"

        );


        return $stmt->execute([

            $telegram_id

        ]);

    }



}
