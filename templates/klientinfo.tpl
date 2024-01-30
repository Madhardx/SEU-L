{include file="head.tpl"}
{include file="dodawanieklienta.tpl"}
{include file="szczegolyklienta.tpl"}

<!--Wyświetlanie szczególów klienta-->
{foreach from=$wsk item=wkl}

{/foreach}
<div class="row mt-3">
    <div class="input-group mb-3">
        <span class="input-group-text" id="basic-addon1">Imie i nazwisko</span>
        <input type="text" readonly class="form-control" value="{$wkl.imieNazwisko}" aria-label="Username" aria-describedby="basic-addon1">
    </div>
    <div class="input-group mb-3">
        <span class="input-group-text" id="basic-addon1">Dokument</span>
        <input type="text" readonly class="form-control" value="{$wkl.dokument}" aria-label="Dokument" aria-describedby="basic-addon1">
    </div>
    <div class="input-group mb-3">
        <span class="input-group-text" id="basic-addon1">Adres</span>
        <input type="text" readonly class="form-control" value="{$wkl.adres}" aria-label="Adres" aria-describedby="basic-addon1">
    </div>
    <div class="input-group mb-3">
        <span class="input-group-text" id="basic-addon1">Dodany przez</span>
        <input type="text" readonly class="form-control" value="{$wkl.userID}" aria-label="dodany przez" aria-describedby="basic-addon1">
    </div>
    <div class="input-group mb-3">
        <span class="input-group-text" id="basic-addon1">Zawarte umowy: </span>
        <input type="text" readonly class="form-control" value="{foreach from=$zawarteUmowy item=umowy}  {$umowy.Nr} {/foreach}" aria-label="Username" aria-describedby="basic-addon1">
    </div>
</div>
{include file="foot.tpl"}