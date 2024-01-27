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
<div class="row mt-3 mb-3">
    <div class="col ">

        {if isset($umowy)}
        <select class="form-select" aria-label="Default select example">
            <option selected>Wybierz umowę</option>
            {foreach from=$umowy item=umowa}
            <option value="{$umowa.id}">{$umowa.Nr} </option>
            {/foreach}
            {/if}
        </select>
    </div>
</div>
<div class="row mt-3 mb-3">
    <div class="col">
        <table class="table table-hover">
            <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Nr</th>
                    <th scope="col">Ważna do</th>
                    <th scope="col">Przedmiot</th>
                    <th scope="col">Dodano przez</th>
                </tr>
            </thead>
            <tbody class="table-group-divider">
                {foreach from=$umowy item=umowa}
                <tr>
                    <th scope="row">{$lp}</th>
                    <td>{$umowa.Nr}</td>
                    <td>{$umowa.Okres}</td>
                    <td>{$umowa.Przedmiot}</td>
                    <td>{$umowa.userID}</td>
                </tr>
                {$lp = $lp+1}
                {/foreach}
            </tbody>
        </table>
    </div>
</div>
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
                <label for="Okres" class="form-label">Okres</label>
                <input type="text" name="Okres" class="form-control" id="Okres" placeholder="Okres" required>
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
                <select class="form-select" aria-label="Default select example" name="imieNazwisko">
                    <option selected id="imieNazwisko ">Wybierz klienta</option>
                    {foreach from=$klienci item=klient}
                    <option value=" {$klient.imieNazwisko}">{$klient.dokument} {$klient.imieNazwisko} </option>
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