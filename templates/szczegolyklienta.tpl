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