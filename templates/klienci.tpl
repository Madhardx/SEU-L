{include file="head.tpl"}
<div class="row mt-3">

    <div class="col">
        <form action="index.php" method="post">
            <input type="hidden" name="action" value="umowy">
            <button type="submit" class="btn btn-primary me-5  w-100">Umowy</button>
        </form>
    </div>
    <div class="col">
        <form action="index.php" method="post">
            <input type="hidden" name="action" value="klienci">
            <button type="submit" class="btn btn-secondary me-5 w-100">Klienci</button>
        </form>
    </div>
    <div class="col">
        <button type="submit" class="btn btn-success me-5 w-100">Zalogowany jako {$nick}</button>
    </div>
    <div class="col">
        <form action="index.php" method="post">
            <input type="hidden" name="action" value="logout">
            <button type="submit" class="btn btn-danger me-5 w-100">Wyloguj się</button>
        </form>
    </div>
</div>
<div class="row mt-3">
    <div class="col">
        <form action="index.php" method="post">
            <input type="hidden" name="action" value="dk">
            <button type="submit" class="btn btn-outline-success me-5  w-100">Dodaj klienta</button>
        </form>
    </div>
    <div class="col">
        <form action="index.php" method="post">
            <input type="hidden" name="action" value="uk">
            <button type="submit" class="btn btn-outline-danger me-5 w-100">Usuń klienta</button>
        </form>
    </div>
    <table class="table">
        <tr>
            <td>3</td>
            <td>2</td>
            <td>1</td>
        </tr>
        <tr>
            <td>3</td>
            <td>2</td>
            <td>1</td>
        </tr>
        <tr>
            <td>3</td>
            <td>2</td>
            <td>1</td>
        </tr>
    </table>



    {include file="foot.tpl"}