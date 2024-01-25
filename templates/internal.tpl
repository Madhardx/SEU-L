{include file="head.tpl"}
<div class="row mt-3">

    <div class="btn-group" role="group" aria-label="Basic mixed styles example">
        <button type="submit" class="btn btn-warning me-5">Zalogowany jako {$nick}</button>

        <button type="submit" class="btn btn-warning me-5">Umowy</button>
        <button type="submit" class="btn btn-success me-5">Klienci</button>
        <form action="index.php" method="post">
            <button type="submit" class="btn btn-danger me-5">Wyloguj się</button>
            <a href="index.php?action=logout"></a>
        </form>
    </div>

    Lorem ipsum dolor sit amet consectetur adipisicing elit.
    Quo veniam eos vero quod nobis nihil hic suscipit pariatur odio fugiat?
    Soluta vero atque nostrum quidem fuga distinctio, ducimus molestias neque.
</div>

{include file="foot.tpl" }