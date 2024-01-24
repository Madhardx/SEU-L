{include file="head.tpl"}
<div class="row">
    <div class="col col-lg-4 offset-lg-4 mt-3 mb-2">
        <div class="text-center">
            <img src="logo.png" class="img-fluid">
        </div>
        <div class="mt-5">
        <form action="index.php" method="post">
        <input type="hidden" name="action" value="gologin">
        <button type="submit" class="btn btn-primary w-100">Zaloguj się</button>
    </div>
    {if isset($loggedin)}
        <div class="alert alert-info" role="alert">
            {$loggedin}
        </div>
        {/if}
    </form>
    </div>
</div>

{include file="foot.tpl" }