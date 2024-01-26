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
    <div class="row mt-3 mb-3">
        <div class="col ">
            {if isset($klienci)}
            <select class="form-select" aria-label="Default select example">
                <option selected>Wybierz klienta</option>
                {foreach from=$klienci item=klient}
                <option value="{$klient.id}">{$klient.id} {$klient.imieNazwisko} {$klient.dokument} {$klient.adres} </option>
                {/foreach}
                {/if}
            </select>
        </div>
    </div>
    {if isset($dodkl)}
    <div class=" row justify-content-evenly-mt5">
        <form action="index.php" method="post">
            <div class="col-6">
                <input type="hidden" name="action" value="processDK">
                <div class="mb-3 mt-3">
                    <label for="imieNazwisko" class="form-label">Imie i nazwisko</label>
                    <input type="text" name="imieNazwisko" class="form-control" id="imieNazwisko" placeholder="Imie i nazwisko" required>
                </div>
            </div>
            <div class="col-6">
                <div class="mb-3 mt-3">
                    <label for="dokument" class="form-label">Dokument</label>
                    <input type="text" name="dokument" class="form-control" id="dokument" placeholder="Dowód osobisty ciągiem bez spacji" required>
                </div>
                <div class="mb-3 mt-3">
                    <label for="adres" class="form-label">Adres</label>
                    <input type="text" name="adres" class="form-control" id="adres" placeholder="Pełny adres" required>
                    <div class="mt-4">
                    </div>
                    <button type="submit" class="btn btn-primary w-100">Dodaj klienta</button>
                </div>
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
        </form>
    </div>

    {elseif isset($usukl)}
    <div class="row mt-3">
        <form action="index.php" method="post">
            <div class="col-md-6 ms-auto ">
                <input type="hidden" name="action" value="processUK">
                <div class="ms-4">
                </div>
            </div>
            <div class="col-md-6 ms-auto">
                <div class="mb-3 mt-3 ms-4">
                    <label for="dokument" class="form-label">Dokument</label>
                    <input type="text" name="dokument" class="form-control" id="dokument" placeholder="Dowód osobisty ciągiem bez spacji" required>
                </div>
                <div class="mb-3 mt-3 ms-4">
                    <label for="adminPass" class="form-label">Hasło administratora</label>
                    <input type="password" name="adminPass" class="form-control" id="adminPass" placeholder="Hasło Administratora" required>
                </div>
                <div class="mt-4 ms-4  ">
                    <button type="submit" class="btn btn-primary w-100">Usuń klienta</button>
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