{include file="head.tpl"}
<div class="row">
    <div class="col col-lg-4 offset-lg-4 mt-3 mb-2">
        <div class="text-center">
            <img src="logo.png" class="img-fluid">
        </div>
        <div class="mb-3">
            <h2 class="text-center">Załóż konto pracownikowi</h2>
        </div>
        <form action="reg.php" method="post">
            <input type="hidden" name="action" value="processRegister">
            <div class="mb-3 mt-3">
                <label for="login" class="form-label">Login</label>
                <input type="text" name="login" class="form-control" id="Login" placeholder="Wpisz login" required>
            </div>
            <div class="mb-3 mt-3">
                <label for="password" class="form-label">Hasło</label>
                <input type="password" name="password" class="form-control" id="password" placeholder="" required>>
            </div>
            <div class="mb-3 mt-3">
                <label for="nick" class="form-label">Imię i Naziwsko</label>
                <input type="text" name="nick" class="form-control" id="nick" placeholder="Imię i nazwisko pracownika" required>>
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
    </div>
</div>
{include file="foot.tpl"}