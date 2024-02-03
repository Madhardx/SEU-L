<!DOCTYPE html>
<html lang="en" >
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
            <h2 class="text-center">Załóż konto pracownikowi</h2>
        </div>
        <form action="index.php" method="post">
            <input type="hidden" name="action" value="processRegister">
            <div class="mb-3 mt-3">
                <label for="login" class="form-label">Login</label>
                <input type="text" name="login" class="form-control" id="Login" placeholder="Wpisz login" required>
            </div>
            <div class="mb-3 mt-3">
                <label for="password" class="form-label">Hasło</label>
                <input type="password" name="password" class="form-control" id="password" placeholder="" required>
            </div>
            <div class="mb-3 mt-3">
                <label for="nick" class="form-label">Imię i Naziwsko</label>
                <input type="text" name="nick" class="form-control" id="nick" placeholder="Imię i nazwisko pracownika" required>
            </div>
            <div class="mb-3 mt-3">
                <label for="adminPass" class="form-label">Hasło administratora</label>
                <input type="password" name="adminPass" class="form-control" id="adminPass" placeholder="Hasło Administratora" required>
            </div>
            <div>
                <button type="submit" class="btn btn-primary w-100">Utwórz konto</button>
                {if isset($blad)}
                <div class="alert alert-danger mt-3" role="alert">
                    {$blad}
                </div>
                {/if}
                {if isset($sukces)}
                <div class="alert alert-success mt-3" role="alert">
                    {$sukces}
                </div>
                {/if}
            </div>
        </form>
        <div class="mt-3">
            <form action="index.php" method="post">
                <button type="submit" class="btn btn-primary w-100">Wróć</button>
                <a href="index.php"></a>
        </div>
    </div>
</div>
{include file="foot.tpl"}