<?php
require_once('Smarty.class.php');

$smarty = new Smarty();
$db = new mysqli('localhost', 'root', '', 'seul');

$smarty->setTemplateDir('templates');
$smarty->setCompileDir('templates_c');
$smarty->setCacheDir('cache');
$smarty->setConfigDir('configs');


$smarty->display('index.tpl');
