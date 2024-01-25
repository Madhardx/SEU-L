<?php
require_once('Smarty.class.php');
session_start();
$smarty = new Smarty();
$db = new mysqli('localhost', 'root', '', 'seul');

$smarty->setTemplateDir('templates');
$smarty->setCompileDir('templates_c');
$smarty->setCacheDir('cache');
$smarty->setConfigDir('configs');

$adminPass = '$2y$10$QsEgXIX4GdD4XnwT8ksBheSmm2al/2cxz8NxdgQ.NdfRXpu90.mWa'; //zahashowane hasło: admin
if (isset($_SESSION['nick'])) {
    $smarty->assign('nick', $_SESSION['nick']);
}

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
                $_SESSION['nick'] = $row['nick'];
                $smarty->assign('nick', $_SESSION['nick']);
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
            if (password_verify($_REQUEST['adminPass'], $adminPass)) {
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
        case 'logout':
            session_destroy();
            header('Location: index.php');
            break;
        case 'umowy':
            $smarty->display('umowy.tpl');
            break;
        case 'klienci':
            $smarty->display('klienci.tpl');
            break;
        case 'dk':
            $smarty->assign('dodkl', "Wprowadź poprawne dane klienta");
            $smarty->display('klienci.tpl');
            break;
        case 'uk':
            $smarty->assign('usukl', "Wprowadź poprawne dane klienta");
            $smarty->display('klienci.tpl');
            break;
        case 'du':
            $smarty->assign('dodum', "Wprowadź poprawne dane umowy");
            $smarty->display('umowy.tpl');
            break;
        case 'uu':
            $smarty->assign('usuum', "Wprowadź poprawne dane umowy");
            $smarty->display('umowy.tpl');
            break;
    }
} else {
    $smarty->display('index.tpl');
}
