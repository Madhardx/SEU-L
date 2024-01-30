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
<!--Tabela klientów-->
<div class="row mt-3 mb-3">
    <div class="col">
        <table class="table table-hover">
            <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Imię i nazwisko</th>
                    <th scope="col">Dokument</th>
                    <th scope="col">Adres</th>
                </tr>
            </thead>
            <tbody class="table-group-divider">
                {foreach from=$klienci item=klient}
                <tr>
                    <th scope="row">{$lp}</th>
                    <td>{$klient.imieNazwisko}</td>
                    <td>{$klient.dokument}</td>
                    <td>{$klient.adres}</td>
                </tr>
                {$lp = $lp+1}
                {/foreach}
            </tbody>
        </table>
    </div>
</div>

{include file="foot.tpl"}