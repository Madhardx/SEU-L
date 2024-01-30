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

{include file="foot.tpl"}