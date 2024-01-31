<?php
require_once('Smarty.class.php');
session_start();
global $smarty;
$smarty = new Smarty();

global $db;
$db = new mysqli('localhost', 'root', '', 'seul');

$smarty->setTemplateDir('templates');
$smarty->setCompileDir('templates_c');
$smarty->setCacheDir('cache');
$smarty->setConfigDir('configs');

$adminPass = '$2y$10$QsEgXIX4GdD4XnwT8ksBheSmm2al/2cxz8NxdgQ.NdfRXpu90.mWa'; //zahashowane hasło: admin

//FUNKCJE
function listaKlientow()
{
    $query = $GLOBALS['db']->prepare("SELECT * FROM klienci");
    $query->execute();
    $result = $query->get_result();
    $klienci = array();
    while ($row = $result->fetch_assoc()) {
        array_push($klienci, $row);
    }
    $lp = 1;
    $GLOBALS['smarty']->assign('lp', $lp);
    $GLOBALS['smarty']->assign('klienci', $klienci);
}
function listaUmow()
{
    $query = $GLOBALS['db']->prepare("SELECT * FROM umowy ORDER BY Okres ASC");
    $query->execute();
    $result = $query->get_result();
    $umowy = array();
    while ($row = $result->fetch_assoc()) {
        array_push($umowy, $row);
    }
    $lp = 1;
    $GLOBALS['smarty']->assign('lp', $lp);
    $GLOBALS['smarty']->assign('umowy', $umowy);
}
if (isset($_SESSION['nick'])) {
    $smarty->assign('nick', $_SESSION['nick']);
}
if (isset($_REQUEST['action'])) {

    switch ($_REQUEST['action']) {
        case 'gologin':
            $smarty->display('login.tpl');
            break;
        case 'processLogin': //logowanie się
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
                $_SESSION['id'] = $row['id'];
                $smarty->assign('nick', $_SESSION['nick']);
                $smarty->assign('id', $_SESSION['id']);
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
        case 'processRegister': // zakładanie konta dla pracownika
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
        case 'umowy': //przejscie do listy umów
            listaUmow();
            $smarty->display('umowy.tpl');
            break;
        case 'wsu':
            //wybieranie listy umów
            listaUmow();
            //Dane ogólne umowy
            $query = $db->prepare("SELECT * FROM umowy where Nr= ? ");
            $query->bind_param("s", $_REQUEST['Nr']);
            $query->execute();
            $result = $query->get_result();
            $wsu = array();
            while ($row = $result->fetch_assoc()) {
                array_push($wsu, $row);
            }
            $smarty->assign('wsu', $wsu);
            $smarty->display('umowyInfo.tpl');
            break;
        case 'du':
            $smarty->assign('dodum', "Wprowadź poprawne dane umowy");
            listaKlientow();
            $smarty->display('umowyO.tpl');
            break;
        case 'processDU': //dodawanie umowy
            $query = $db->prepare("SELECT * FROM umowy WHERE Nr =?");
            $query->bind_param("s", $_REQUEST['Nr']);
            $query->execute();
            $result = $query->get_result();
            if ($result->num_rows == 1) {
                $smarty->assign('dodum', "Wprowadź poprawne dane klienta");
                $smarty->assign('blad', "Istnieje już umowa o tym numerze");
                $smarty->display("umowyO.tpl");
            } else {
                $query = $db->prepare("INSERT INTO umowy (id, Nr, DataZ, Okres, Przedmiot, wartosc, userID, klientID) VALUES (NULL, ?, ?, ?, ?, ?, ?, ?)");
                $query->bind_param("sssssss", $_REQUEST['Nr'], $_REQUEST['DataZ'], $_REQUEST['Okres'], $_REQUEST['Przedmiot'], $_REQUEST['wartosc'], $_SESSION['nick'], $_REQUEST['dokument']);
                $query->execute();
                $smarty->assign('dodum', "Wprowadź poprawne dane klienta");
                $smarty->assign('sukces', "Dodano umowę");
                $smarty->display("umowyO.tpl");
            }
            break;
        case 'uu':
            $smarty->assign('usuum', "Wprowadź poprawne dane umowy");
            $smarty->display('umowyO.tpl');
            break;
        case 'processUU': //usuwanie umowy
            if (password_verify($_REQUEST['adminPass'], $adminPass)) {
                $query = $db->prepare("SELECT * FROM umowy WHERE nr =?");
                $query->bind_param("s", $_REQUEST['nr']);
                $query->execute();
                $result = $query->get_result();
                if ($result->num_rows == 0) {
                    $smarty->assign('usuum', "Wprowadź poprawne dane klienta");
                    $smarty->assign('blad', "Umowa o tym numerze nie istnieje w bazie danych");
                    $smarty->display("umowy.tpl");
                } elseif ($result->num_rows == 1) {
                    $query = $db->prepare("DELETE FROM umowy WHERE nr =?");
                    $query->bind_param("s", $_REQUEST['nr']);
                    $query->execute();
                    $smarty->assign('usuum', "Wprowadź poprawne dane klienta");
                    $smarty->assign('sukces', "Usunięto umowę");
                    $smarty->display("umowy.tpl");
                }
            } else {
                $smarty->assign('usuum', "Wprowadź poprawne dane klienta");
                $smarty->assign('blad', "Nie jesteś uprawniony do usuwania umów");
                $smarty->display('umowyO.tpl');
            }
            break;
        case 'klienci': // lista klientów
            listaKlientow();
            $smarty->display('klienci.tpl');
            break;
        case 'wsk':
            //Dane ogólne klienta
            $query = $db->prepare("SELECT * FROM klienci where dokument= ? ");
            $query->bind_param("s", $_REQUEST['dokument']);
            $query->execute();
            $result = $query->get_result();
            $wsk = array();
            while ($row = $result->fetch_assoc()) {
                array_push($wsk, $row);
            }
            $smarty->assign('wsk', $wsk);
            //zawarte umowy
            $query = $db->prepare("SELECT * FROM umowy where klientID= ? ");
            $query->bind_param("s", $_REQUEST['dokument']);
            $query->execute();
            $result = $query->get_result();
            $zawarteUmowy = array();
            while ($row = $result->fetch_assoc()) {
                array_push($zawarteUmowy, $row);
            }
            $smarty->assign('zawarteUmowy', $zawarteUmowy);
            //wybór klienta
            listaKlientow();
            $smarty->display('klientinfo.tpl');
            break;
        case 'dk':
            $smarty->assign('dodkl', "Wprowadź poprawne dane klienta");
            $smarty->display('klienciO.tpl');
            break;
        case 'processDK': //dodwanie klienta
            $query = $db->prepare("SELECT * FROM klienci WHERE dokument =?");
            $query->bind_param("s", $_REQUEST['dokument']);
            $query->execute();
            $result = $query->get_result();
            if ($result->num_rows == 1) {
                $smarty->assign('dodkl', "Wprowadź poprawne dane klienta");
                $smarty->assign('blad', "Klient posługujący się tym dokumentem istnieje w bazie danych");
                $smarty->display("klienciO.tpl");
            } else {
                $query = $db->prepare("INSERT INTO klienci (id, imieNazwisko, dokument, adres, userID) VALUES (NULL, ?, ?, ?, ?)");
                $query->bind_param("ssss", $_REQUEST['imieNazwisko'], $_REQUEST['dokument'], $_REQUEST['adres'], $_SESSION['nick']);
                $query->execute();
                $smarty->assign('dodkl', "Wprowadź poprawne dane klienta");
                $smarty->assign('sukces', "Dodano klienta");
                $smarty->display("klienciO.tpl");
            }
            break;
        case 'uk':
            $smarty->assign('usukl', "Wprowadź poprawne dane klienta");
            $smarty->display('klienciO.tpl');
            break;
        case 'processUK': // usuwanie klienta
            if (password_verify($_REQUEST['adminPass'], $adminPass)) {
                $query = $db->prepare("SELECT * FROM klienci WHERE dokument =?");
                $query->bind_param("s", $_REQUEST['dokument']);
                $query->execute();
                $result = $query->get_result();
                if ($result->num_rows == 0) {
                    $smarty->assign('usukl', "Wprowadź poprawne dane klienta");
                    $smarty->assign('blad', "Klient posługujący się tym dokumentem nie istnieje w bazie danych");
                    $smarty->display("klienciO.tpl");
                } elseif ($result->num_rows == 1) {
                    $query = $db->prepare("DELETE FROM klienci WHERE dokument =?");
                    $query->bind_param("s", $_REQUEST['dokument']);
                    $query->execute();
                    $smarty->assign('usukl', "Wprowadź poprawne dane klienta");
                    $smarty->assign('sukces', "Usunięto klienta");
                    $smarty->display("klienciO.tpl");
                }
            } else {
                $smarty->assign('usukl', "Wprowadź poprawne dane klienta");
                $smarty->assign('blad', "Nie jesteś uprawniony do usuwania klientów");
                $smarty->display('klienciO.tpl');
            }
            break;
    }
} else {
    $smarty->display('index.tpl');
}
