<?php
require_once('Smarty.class.php');

$smarty = new Smarty();

$db = new mysqli('localhost', 'root', '', 'seul');
$smarty->setTemplateDir('templates');
$smarty->setCompileDir('templates_c');
$smarty->setCacheDir('cache');
$smarty->setConfigDir('configs');

if (isset($_REQUEST['action'])) {
    switch ($_REQUEST['action']) {
        case 'register':
            $smarty->display('register.tpl');
            break;
        case 'processRegister':
            $query = $db->prepare("INSERT INTO user (id, login, password, nick) VALUES (NULL, ?, ?, ?)");
            $passwordHash = password_hash($_REQUEST['password'], PASSWORD_ARGON2I);
            $query->bind_param("sss", $_REQUEST['login'], $passwordHash,  $_REQUEST['nick']);
            $query->execute();
            if ($query->errno == 1062) {
                $smarty->assign('error', "Istnieje już użytkownik o takim loginie");
                $smarty->display('register.tpl');
            } else {
                $smarty->display('index.tpl');
            }
            break;
        default:
            $smarty->display('register.tpl');
    }
} else {
    $smarty->display('register.tpl');
}
