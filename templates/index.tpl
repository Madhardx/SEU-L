{include file="head.tpl" }
<div class="container">
    <div class="row">
        <div class="col col-lg-4 offset-lg-4 mt-3 mb-2">
            <div class="text-center">
                <img src="logo.png" class="img-fluid">
            </div>
            <div class="mb-3">
                <h2 class="text-center">Zaloguj się</h2>
            </div>
            <form action="index.php">
                <div class="mb-5 mt-5">
                    <label for="Login" class="form-label">Login</label>
                    <input type="text" class="form-control" id="Login" placeholder="Wpisz swój login">
                </div>
                <div class="mb-5 mt-5"">
                <label for=" Password" class="form-label">Hasło</label>
                    <input type="text" class="form-control" id="password" placeholder="">
                </div>
                <div>
                    <button type="submit" class="btn btn-primary w-100">Zaloguj się</button>
                </div>
            </form>
        </div>
    </div>
</div>
{include file="foot.tpl" }