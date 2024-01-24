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
            $query = $db->prepare("SELECT * FROM user WHERE login = ? LIMIT 1");
            $query->bind_param("s", $_REQUEST['login']);
            $query->execute();
            $result = $query->get_result();
            if ($result->num_rows == 1) {
                $smarty->assign('blad', "Istnieje już użytkownik o takim loginie");
                $smarty->display('register.tpl');
            } else {
                $query = $db->prepare("INSERT INTO user (id, login, password, nick) VALUES (NULL, ?, ?, ?)");
                $passwordHash = password_hash($_REQUEST['password'], PASSWORD_DEFAULT);
                $query->bind_param("sss", $_REQUEST['login'], $passwordHash,  $_REQUEST['nick']);
                $query->execute();
                $smarty->assign('sukces', "Poprawnie założono konto pracownika");
                $smarty->display('register.tpl');
            }
            break;
        default:
            $smarty->display('register.tpl');
    }
} else {
    $smarty->display('register.tpl');
}
