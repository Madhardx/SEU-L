{include file="head.tpl"}
{include file="dodawanieumowy.tpl"}
{include file="szczegolyumowy.tpl"}

<!--Wyświetlanie listy umow-->
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