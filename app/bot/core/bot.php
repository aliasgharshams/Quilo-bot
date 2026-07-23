<?php

$config = require __DIR__ . "/../../config/config.php";


function telegram($method, $data = [])
{

    global $config;


    $url = "https://api.telegram.org/bot"
        .$config["telegram"]["token"]
        ."/".$method;


    $ch = curl_init();


    curl_setopt($ch, CURLOPT_URL, $url);

    curl_setopt($ch, CURLOPT_POST, true);

    curl_setopt($ch, CURLOPT_POSTFIELDS, $data);

    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);


    $result = curl_exec($ch);


    curl_close($ch);


    return json_decode($result,true);

}
