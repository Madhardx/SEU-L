{include file="head.tpl"}

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
            <div class=" mb-5 mt-5">
                <label for="login" class="form-label">Login</label>
                <input type="text" name="login" class="form-control" id="login" placeholder="Wpisz swój login">
            </div>
            <div class="mb-5 mt-5">
                <label for="password" class="form-label">Hasło</label>
                <input type="text" name="login" class="form-control" id="password" placeholder="">
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
    </div>
</div>
{include file="foot.tpl" }