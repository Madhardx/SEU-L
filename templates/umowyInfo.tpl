{include file="head.tpl"}
{include file="dodawanieumowy.tpl"}
{include file="szczegolyumowy.tpl"}

<!--Wyświetlanie szczególów umowy-->
{foreach from=$wsu item=wul}

{/foreach}
<div class="row mt-3">
    <div class="input-group mb-3">
        <span class="input-group-text" id="basic-addon1">Nr umowy:</span>
        <input type="text" readonly class="form-control" value="{$wul.Nr}" aria-label="Username" aria-describedby="basic-addon1">
    </div>
    <div class="input-group mb-3">
        <span class="input-group-text" id="basic-addon1">Data zawarcia:</span>
        <input type="text" readonly class="form-control" value="{$wul.DataZ}" aria-label="Dokument" aria-describedby="basic-addon1">
    </div>
    <div class="input-group mb-3">
        <span class="input-group-text" id="basic-addon1">Data wygaśnięcia:</span>
        <input type="text" readonly class="form-control" value="{$wul.Okres}" aria-label="Adres" aria-describedby="basic-addon1">
    </div>
    <div class="input-group mb-3">
        <span class="input-group-text" id="basic-addon1">Przedmiot umowy:</span>
        <input type="text" readonly class="form-control" value="{$wul.Przedmiot}" aria-label="dodany przez" aria-describedby="basic-addon1">
    </div>
    <div class="input-group mb-3">
        <span class="input-group-text" id="basic-addon1">Wartość:</span>
        <input type="text" readonly class="form-control" value="{$wul.wartosc}" aria-label="dodany przez" aria-describedby="basic-addon1">
    </div>
    <div class="input-group mb-3">
        <span class="input-group-text" id="basic-addon1">Zawarta z:</span>
        <input type="text" readonly class="form-control" value="{$wul.klientID}" aria-label="dodany przez" aria-describedby="basic-addon1">
    </div>
    <div class="input-group mb-3">
        <span class="input-group-text" id="basic-addon1">Zawarta przez:</span>
        <input type="text" readonly class="form-control" value="{$wul.userID}" aria-label="dodany przez" aria-describedby="basic-addon1">
    </div>
</div>
{include file="foot.tpl"}