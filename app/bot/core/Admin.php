<?php

class Admin
{

    private static array $admins = [

        8668159136

    ];


    public static function isAdmin($telegram_id)
    {

        return in_array(
            $telegram_id,
            self::$admins
        );

    }

}
