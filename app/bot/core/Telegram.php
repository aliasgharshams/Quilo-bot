<?php

class Telegram
{

    private string $token;

    private string $api;


    public function __construct()
    {

        $config = require __DIR__ . "/../../config/config.php";

        $this->token = $config["telegram"]["token"];

        $this->api =
            "https://api.telegram.org/bot"
            .$this->token
            ."/";

    }



    public function request(
        string $method,
        array $data = []
    )
    {

        $ch = curl_init();


        curl_setopt(
            $ch,
            CURLOPT_URL,
            $this->api.$method
        );


        curl_setopt(
            $ch,
            CURLOPT_POST,
            true
        );


        curl_setopt(
            $ch,
            CURLOPT_POSTFIELDS,
            $data
        );


        curl_setopt(
            $ch,
            CURLOPT_RETURNTRANSFER,
            true
        );


        $result = curl_exec($ch);


        curl_close($ch);


        return json_decode(
            $result,
            true
        );

    }



    public function sendMessage(
        $chat_id,
        $text,
        $keyboard = null
    )
    {

        $data = [

            "chat_id"=>$chat_id,

            "text"=>$text,

            "parse_mode"=>"HTML"

        ];


        if($keyboard){

            $data["reply_markup"] =
                json_encode($keyboard);

        }


        return $this->request(
            "sendMessage",
            $data
        );

    }



}
