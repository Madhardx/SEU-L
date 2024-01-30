<!DOCTYPE html>
<html lang="en" data-bs-theme="dark">
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
        <div class="mb-3">
            <h2 class="text-center">Zaloguj się</h2>
        </div>
        <form action="index.php" method="post">
            <input type="hidden" name="action" value="processLogin">
            <div class=" mb-3 mt-3">
                <label for="login" class="form-label">Login</label>
                <input type="text" name="login" class="form-control" id="Login" placeholder="Wpisz swój login" required>
            </div>
            <div class="mb-3 mt-3">
                <label for="password" class="form-label">Hasło</label>
                <input type="password" name="password" class="form-control" id="password" placeholder="" required>
            </div>
            <div class="mb-3">
                <button type="submit" class="btn btn-primary w-100">Zaloguj się</button>
            </div>
            {if isset($sukces)}
            <div class="alert alert-success" role="alert">
                {$sukces}
            </div>
            {/if}
            {if isset($error)}
            <div class="alert alert-danger" role="alert">
                {$error}
            </div>
            {/if}
        </form>
        <div class="mt-3">
        <form action="index.php" method="post">
            <button type="submit" class="btn btn-primary w-100">Wróć</button>
            <a href="index.php"></a>
    </div>
    </div>
</div>
{include file="foot.tpl" }