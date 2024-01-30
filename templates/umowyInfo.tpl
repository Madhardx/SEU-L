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
            <input type="hidden" name="action" value="du">
            <button type="submit" class="btn btn-outline-success me-5  w-100">Dodaj umowę</button>
        </form>
    </div>
    <div class="col">
        <form action="index.php" method="post">
            <input type="hidden" name="action" value="uu">
            <button type="submit" class="btn btn-outline-danger me-5 w-100">Usuń umowę</button>
        </form>
    </div>
</div>
<!--Wybieranie szczególów umowy-->
<div class="row mt-3 ">
    <div class="col ">
        <form action="index.php" method="post">
            <input type="hidden" name="action" value="wsu">
            <select class="form-select" aria-label="Default select example" name="Nr">
                <option selected id="Nr">Wybierz umowę</option>
                {foreach from=$umowy item=umowa}
                <option value="{$umowa.Nr}">{$umowa.Nr} </option>
                {/foreach}
            </select>
    </div>
    <div class="col">
        <button type="submit" class="btn btn-outline-info me-5  w-100">Wyświetl szczegóły umowy</button>
    </div>
</div>
</form>
<!--Wyświetlanie szczególów umowy-->
{foreach from=$wsu item=wul}

{/foreach}
<div class="row mt-3">
    <div class="input-group mb-3">
        <span class="input-group-text" id="basic-addon1">Nr umowy:</span>
        <input type="text" readonly class="form-control" value="{$wul.Nr}" aria-label="Username" aria-describedby="basic-addon1">
    </div>
    <div class="input-group mb-3">
        <span class="input-group-text" id="basic-addon1">Data zawarcia:</span>
        <input type="text" readonly class="form-control" value="{$wul.DataZ}" aria-label="Dokument" aria-describedby="basic-addon1">
    </div>
    <div class="input-group mb-3">
        <span class="input-group-text" id="basic-addon1">Data wygaśnięcia:</span>
        <input type="text" readonly class="form-control" value="{$wul.Okres}" aria-label="Adres" aria-describedby="basic-addon1">
    </div>
    <div class="input-group mb-3">
        <span class="input-group-text" id="basic-addon1">Przedmiot umowy:</span>
        <input type="text" readonly class="form-control" value="{$wul.Przedmiot}" aria-label="dodany przez" aria-describedby="basic-addon1">
    </div>
    <div class="input-group mb-3">
        <span class="input-group-text" id="basic-addon1">Wartość:</span>
        <input type="text" readonly class="form-control" value="{$wul.wartosc}" aria-label="dodany przez" aria-describedby="basic-addon1">
    </div>
    <div class="input-group mb-3">
        <span class="input-group-text" id="basic-addon1">Zawarta z:</span>
        <input type="text" readonly class="form-control" value="{$wul.klientID}" aria-label="dodany przez" aria-describedby="basic-addon1">
    </div>
    <div class="input-group mb-3">
        <span class="input-group-text" id="basic-addon1">Zawarta przez:</span>
        <input type="text" readonly class="form-control" value="{$wul.userID}" aria-label="dodany przez" aria-describedby="basic-addon1">
    </div>
</div>
{include file="foot.tpl"}