<?php

$configFile = __DIR__ . "/../app/config/config.php";


$message = "";


if($_SERVER["REQUEST_METHOD"] == "POST"){


    $domain = $_POST["domain"];

    $token = $_POST["token"];

    $admin = $_POST["admin_id"];



    $config = '<?php

return [

"app_name"=>"Quilo-bot",

"version"=>"1.0.0",

"app"=>[

"url"=>"'.$domain.'"

],


"telegram"=>[

"token"=>"'.$token.'",

"admin_id"=>"'.$admin.'"

],


"db"=>[

"host"=>"127.0.0.1",

"name"=>"quilo",

"user"=>"quilo_user",

"pass"=>"Quilo@123456"

]

];

';



    file_put_contents(
        $configFile,
        $config
    );


    $message="✅ تنظیمات ذخیره شد";

}


?>


<!DOCTYPE html>
<html>

<head>

<title>Quilo Setup</title>

<style>

body{

font-family:tahoma;

background:#f5f5f5;

padding:40px;

}

.box{

background:white;

padding:30px;

max-width:400px;

margin:auto;

border-radius:10px;

}

input{

width:100%;

padding:10px;

margin:8px 0;

}

button{

width:100%;

padding:12px;

background:#222;

color:white;

border:0;

}

</style>

</head>


<body>


<div class="box">


<h2>Quilo Installer</h2>


<p>

<?= $message ?>

</p>


<form method="post">


<input

name="domain"

placeholder="https://domain.com"

>


<input

name="token"

placeholder="Bot Token"

>


<input

name="admin_id"

placeholder="Telegram ID Admin"

>


<button>

Install

</button>


</form>


</div>


</body>

</html>
