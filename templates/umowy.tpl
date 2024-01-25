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
    {if isset($dodum)}
    <div class="row justify-content-evenly-mt5">
        <form action="index.php" method="post">
            <div class="col-6">
                <input type="hidden" name="action" value="processDU">
                <div class="mb-3 mt-3">
                    <label for="nr" class="form-label">Nr umowy</label>
                    <input type="text" name="nr" class="form-control" id="nr" placeholder="Nr umowy" required>
                </div>
                <div class="mb-3 mt-3">
                    <label for="dataz" class="form-label">Data zawarcia</label>
                    <input type="date" name="dataz" class="form-control" id="dataz" placeholder="Data zawarcia" required>
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
                    <div class="mt-4">
                    </div>
                    <div class="mb-3 mt-3">
                        <label for="wartosc" class="form-label">Wartość</label>
                        <input type="text" name="wartosc" class="form-control" id="wartosc" placeholder="Wartość w zł" required>
                        <div class="mt-4">
                        </div>
                        <div class="mb-3 mt-3">
                            <label for="adres" class="form-label">Klient</label>
                            <input type="text" name="adres" class="form-control" id="adres" placeholder="Wybierz klienta" required>
                            <div class="mt-4">
                            </div>
                            <button type="submit" class="btn btn-primary w-100">Dodaj umowę</button>
                        </div>
                    </div>
        </form>
    </div>
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
                </div>
            </div>
    </div>
    </form>
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
{else}
<table class="table">
    <tr>
        <td>1</td>
        <td>2</td>
        <td>3</td>
    </tr>
    <tr>
        <td>1</td>
        <td>2</td>
        <td>3</td>
    </tr>
    <tr>
        <td>1</td>
        <td>2</td>
        <td>3</td>
    </tr>
</table>
{/if}


{include file="foot.tpl"}