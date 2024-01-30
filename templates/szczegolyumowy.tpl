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