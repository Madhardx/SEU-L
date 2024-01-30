{include file="head.tpl"}
{include file="dodawanieklienta.tpl"}
{include file="szczegolyklienta.tpl"}

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