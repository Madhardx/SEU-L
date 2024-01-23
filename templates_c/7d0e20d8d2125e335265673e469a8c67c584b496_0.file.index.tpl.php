<?php
/* Smarty version 4.3.4, created on 2024-01-23 13:08:55
  from 'G:\xampp\htdocs\SEU-L\templates\index.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.3.4',
  'unifunc' => 'content_65afac571e7133_72025370',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '7d0e20d8d2125e335265673e469a8c67c584b496' => 
    array (
      0 => 'G:\\xampp\\htdocs\\SEU-L\\templates\\index.tpl',
      1 => 1706011729,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
    'file:head.tpl' => 1,
    'file:foot.tpl' => 1,
  ),
),false)) {
function content_65afac571e7133_72025370 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_subTemplateRender("file:head.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>

<div class="row">
    <div class="col col-lg-4 offset-lg-4 mt-3 mb-2">
        <div class="text-center">
            <img src="logo.png" class="img-fluid">
        </div>
        <div class="mb-3">
            <h2 class="text-center">Zaloguj się</h2>
        </div>
        <form action="index.php">
            <input type="hidden" name="action" value="processLogin">
            <div class=" mb-5 mt-5">
                <label for="Login" class="form-label">Login</label>
                <input type="text" class="form-control" id="Login" placeholder="Wpisz swój login">
            </div>
            <div class="mb-5 mt-5"">
                <label for=" Password" class="form-label">Hasło</label>
                <input type="text" class="form-control" id="password" placeholder="">
            </div>
            <div>
                <button type="submit" class="btn btn-primary w-100">Zaloguj się</button>
            </div>
        </form>
    </div>
</div>

<?php $_smarty_tpl->_subTemplateRender("file:foot.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
}
}
