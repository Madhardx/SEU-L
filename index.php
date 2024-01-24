<?php
require_once('Smarty.class.php');

$smarty = new Smarty();
$db = new mysqli('localhost', 'root', '', 'seul');

$smarty->setTemplateDir('templates');
$smarty->setCompileDir('templates_c');
$smarty->setCacheDir('cache');
$smarty->setConfigDir('configs');

$adminPass = 'admin';

if (isset($_REQUEST['action'])) {
    switch ($_REQUEST['action']) {
        case 'gologin':
            $smarty->display('login.tpl');
            break;
        case 'processLogin':
            $query = $db->prepare("SELECT * FROM user WHERE login = ?");
            $query->bind_param("s", $_REQUEST['login']);
            $query->execute();
            $result = $query->get_result();
            if ($result->num_rows == 0) {
                $smarty->assign('error', "Błędny login lub hasło");
                $smarty->display('login.tpl');
                break;
            }
            $row = $result->fetch_assoc();
            if (password_verify($_REQUEST['password'], $row['password'])) {
                $smarty->assign('loggedin', "Poprawnie zalogowano użytkownika");
                $smarty->display('internal.tpl');
            } else {
                $smarty->assign('error', "Błędny login lub hasło");
                $smarty->display('login.tpl');
                break;
            }
            break;
        case 'goregister':
            $smarty->display('register.tpl');
            break;
        case 'processRegister':
            $query = $db->prepare("SELECT * FROM user WHERE login = ? LIMIT 1");
            $query->bind_param("s", $_REQUEST['login']);
            $query->execute();
            $result = $query->get_result();
            if ($_REQUEST['adminPass'] == $adminPass) {
                if ($result->num_rows == 1) {
                    $smarty->assign('blad', "Istnieje już użytkownik o takim loginie");
                } else {
                    $query = $db->prepare("INSERT INTO user (id, login, password, nick) VALUES (NULL, ?, ?, ?)");
                    $passwordHash = password_hash($_REQUEST['password'], PASSWORD_DEFAULT);
                    $query->bind_param("sss", $_REQUEST['login'], $passwordHash,  $_REQUEST['nick']);
                    $query->execute();
                    $smarty->assign('sukces', "Poprawnie założono konto pracownika");
                    $smarty->display('index.tpl');
                }
            } else {
                $smarty->assign('blad', "Nie jesteś uprawniony do zakładania konta");
                $smarty->display('register.tpl');
            }
            break;
        default:
            $smarty->display('register.tpl');
    }
} else {
    $smarty->display('internal.tpl');
}
