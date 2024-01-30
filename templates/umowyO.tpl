{include file="head.tpl"}
{include file="dodawanieumowy.tpl"}

<!--Dodawanie umowy-->
{if isset($dodum)}
<div class="row justify-content-evenly-mt5">
    <form action="index.php" method="post">
        <div class="col-6">
            <input type="hidden" name="action" value="processDU">
            <div class="mb-3 mt-3">
                <label for="Nr" class="form-label">Nr umowy</label>
                <input type="text" name="Nr" class="form-control" id="Nr" placeholder="NR/MM/RRRR" required>
            </div>
            <div class="mb-3 mt-3">
                <label for="DataZ" class="form-label">Data zawarcia</label>
                <input type="date" name="DataZ" class="form-control" id="DataZ" placeholder="Data zawarcia" required>
            </div>
        </div>
        <div class="col-6">
            <div class="mb-3 mt-3">
                <label for="Okres" class="form-label">Data wygaśnięcia</label>
                <input type="date" name="Okres" class="form-control" id="Okres" placeholder="Okres" required>
            </div>
            <div class="mb-3 mt-3">
                <label for="Przedmiot" class="form-label">Przedmiot</label>
                <input type="text" name="Przedmiot" class="form-control" id="Przedmiot" placeholder="Przedmiot" required>
            </div>
            <div class="mb-3 mt-3">
                <label for="wartosc" class="form-label">Wartość</label>
                <input type="text" name="wartosc" class="form-control" id="wartosc" placeholder="Wartość w zł" required>
            </div>
            <div class="mb-3 mt-3">
                <select class="form-select" aria-label="Default select example" name="dokument">
                    <option selected id="dokument">Wybierz klienta</option>
                    {foreach from=$klienci item=klient}
                    <option value="{$klient.dokument}">{$klient.dokument} {$klient.imieNazwisko} </option>
                    {/foreach}
                </select>
            </div>
            <div class="mb-3 mt-3">
                <button type="submit" class="btn btn-primary w-100">Dodaj umowę</button>
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
        </div>
</div>
</form>
<!--usuwanie umowy-->
{elseif isset($usuum)}
<div class="row mt-3">
    <form action="index.php" method="post">
        <div class="col-md-6 ms-auto ">
            <input type="hidden" name="action" value="processUU">
            <div class="mb-3 mt-3 ms-4">
                <label for="nr" class="form-label">Nr umowy</label>
                <input type="text" name="nr" class="form-control" id="nr" placeholder="Nr umowy" required>
            </div>
            <div class="mb-3 mt-3 ms-4">
                <label for="adminPass" class="form-label">Hasło administratora</label>
                <input type="password" name="adminPass" class="form-control" id="adminPass" placeholder="Hasło Administratora" required>
            </div>
            <div class="mt-4 ms-4  ">
                <button type="submit" class="btn btn-primary w-100">Usuń umowę</button>
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
        </div>
</div>
</form>
{/if}
{include file="foot.tpl"}