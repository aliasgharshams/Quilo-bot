<?php


class Router
{


    private array $routes = [];



    public function add(
        string $type,
        callable $callback
    )
    {

        $this->routes[$type] = $callback;

    }



    public function dispatch($update)
    {

        if(isset($update["message"])){

            if(isset($update["message"]["text"])){

                $text =
                $update["message"]["text"];


                if(isset($this->routes[$text])){

                    return call_user_func(
                        $this->routes[$text],
                        $update
                    );

                }

            }

        }


        return null;

    }


}
