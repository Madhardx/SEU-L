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
</div>
<!--Wybieranie szczególów klienta-->
<div class="row mt-3 ">
    <div class="col ">
        <form action="index.php" method="post">
        <input type="hidden" name="action" value="wsk">
        <select class="form-select" aria-label="Default select example" name="dokument">
        <option selected id="dokument">Wybierz klienta</option>
        {foreach from=$klienci item=klient}
        <option value="{$klient.dokument}">{$klient.dokument} {$klient.imieNazwisko} </option>
        {/foreach}
    </select>
    </div>
    <div class="col">
        <button type="submit" class="btn btn-outline-info me-5  w-100">Wyświetl szczegóły klienta</button>
    </div>
</div>
</form>

<!--Wyświetlanie szczególów klienta-->
<div class="row mt-3">

    <div class="input-group mb-3">
        <span class="input-group-text" id="basic-addon1">Imie i nazwisko</span>
        <input type="text" readonly class="form-control" value="{$wsk.imieNazwisko}" aria-label="Username" aria-describedby="basic-addon1">
    </div>
    <div class="input-group mb-3">
        <span class="input-group-text" id="basic-addon1">Dokument</span>
        <input type="text" readonly class="form-control" value="test" aria-label="Dokument" aria-describedby="basic-addon1">
    </div>
    <div class="input-group mb-3">
        <span class="input-group-text" id="basic-addon1">Adres</span>
        <input type="text" readonly class="form-control" value="test" aria-label="Adres" aria-describedby="basic-addon1">
    </div>
    <div class="input-group mb-3">
        <span class="input-group-text" id="basic-addon1">Dodany przez</span>
        <input type="text" readonly class="form-control" value="test" aria-label="dodany przez" aria-describedby="basic-addon1">
    </div>
    <div class="row mt-3">
        <p>Zawarte umowy:</p>
    </div>
    {foreach from=$klienci item=klient}
    <option value=" {$klient.id}"> {$klient.imieNazwisko} {$klient.dokument} </option>
    {/foreach}


    {include file="foot.tpl"}