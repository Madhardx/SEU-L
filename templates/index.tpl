<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SEU-L</title>
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" 
     rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
  </head>


<body>
<div class="container">
<div class="row">
    <div class="col col-lg-4 offset-lg-4 mt-3 mb-2">
        <div class="text-center">
            <img src="logo.png" class="img-fluid">
        </div>
        <div class="mt-5 mb-3">
            <form action="index.php" method="post">
                <input type="hidden" name="action" value="gologin">
                <button type="submit" class="btn btn-primary w-100">Zaloguj się</button>
        </div>
        </form>
        <form action="index.php" method="post">
            <input type="hidden" name="action" value="goregister">
            <button type="submit" class="btn btn-primary w-100">Zarejestruj pracownika</button>
            {if isset($sukces)}
            <div class="alert alert-success mt-3" role="alert">
                {$sukces}
            </div>
            {/if}
    </div>

    </form>
</div>
</div>

{include file="foot.tpl" }