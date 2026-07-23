<?php

require_once "app/bot/core/Telegram.php";

$bot = new Telegram();

print_r(
    $bot->request("getMe")
);
