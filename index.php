<?php
require_once('Smarty.class.php');
session_start();

//ZMIENNE
global $smarty;
$smarty = new Smarty();

global $db;
$db = new mysqli('localhost', 'root', '', 'seul');

$smarty->setTemplateDir('templates');
$smarty->setCompileDir('templates_c');
$smarty->setCacheDir('cache');
$smarty->setConfigDir('configs');

global $adminPass;
$adminPass = '$2y$10$QsEgXIX4GdD4XnwT8ksBheSmm2al/2cxz8NxdgQ.NdfRXpu90.mWa'; //zahashowane hasło: admin

//FUNKCJE
function processlogin()
{
    $query = $GLOBALS['db']->prepare("SELECT * FROM user WHERE login = ?");
    $query->bind_param("s", $_REQUEST['login']);
    $query->execute();
    $result = $query->get_result();
    if ($result->num_rows == 0) {
        $GLOBALS['smarty']->assign('error', "Błędny login lub hasło");
        $GLOBALS['smarty']->display('login.tpl');
    }
    $row = $result->fetch_assoc();
    if (password_verify($_REQUEST['password'], $row['password'])) {
        $_SESSION['nick'] = $row['nick'];
        $_SESSION['id'] = $row['id'];
        $GLOBALS['smarty']->assign('nick', $_SESSION['nick']);
        $GLOBALS['smarty']->assign('id', $_SESSION['id']);
        $GLOBALS['smarty']->display('internal.tpl');
    } else {
        $GLOBALS['smarty']->assign('error', "Błędny login lub hasło");
        $GLOBALS['smarty']->display('login.tpl');
    }
}
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
function processregister()
{
    $query = $GLOBALS['db']->prepare("SELECT * FROM user WHERE login = ? LIMIT 1");
    $query->bind_param("s", $_REQUEST['login']);
    $query->execute();
    $result = $query->get_result();
    if (password_verify($_REQUEST['adminPass'], $GLOBALS['adminPass'])) {
        if ($result->num_rows == 1) {
            $GLOBALS['smarty']->assign('blad', "Istnieje już użytkownik o takim loginie");
        } else {
            $query = $GLOBALS['db']->prepare("INSERT INTO user (id, login, password, nick) VALUES (NULL, ?, ?, ?)");
            $passwordHash = password_hash($_REQUEST['password'], PASSWORD_DEFAULT);
            $query->bind_param("sss", $_REQUEST['login'], $passwordHash,  $_REQUEST['nick']);
            $query->execute();
            $GLOBALS['smarty']->assign('sukces', "Poprawnie założono konto pracownika");
            $GLOBALS['smarty']->display('index.tpl');
        }
    } else {
        $GLOBALS['smarty']->assign('blad', "Nie jesteś uprawniony do zakładania konta");
        $GLOBALS['smarty']->display('register.tpl');
    }
}
function daneUmowy()
{
    $query = $GLOBALS['db']->prepare("SELECT * FROM umowy where Nr= ? ");
    $query->bind_param("s", $_REQUEST['Nr']);
    $query->execute();
    $result = $query->get_result();
    $wsu = array();
    if ($result->num_rows == 0) {
        listaKlientow();
        $GLOBALS['smarty']->assign('blad', "Nie wybrano umowy");
        $GLOBALS['smarty']->display('umowy.tpl');
    } else {
        while ($row = $result->fetch_assoc()) {
            array_push($wsu, $row);
        }
        $GLOBALS['smarty']->assign('wsu', $wsu);
        $GLOBALS['smarty']->display('umowyInfo.tpl');
    }
}
function processdu()
{
    $query = $GLOBALS['db']->prepare("SELECT * FROM umowy WHERE Nr =?");
    $query->bind_param("s", $_REQUEST['Nr']);
    $query->execute();
    $result = $query->get_result();
    if ($result->num_rows == 1) {
        $GLOBALS['smarty']->assign('dodum', "Wprowadź poprawne dane klienta");
        $GLOBALS['smarty']->assign('blad', "Istnieje już umowa o tym numerze");
        $GLOBALS['smarty']->display("umowyO.tpl");
    } else {
        $query = $GLOBALS['db']->prepare("INSERT INTO umowy (id, Nr, DataZ, Okres, Przedmiot, wartosc, userID, klientID) VALUES (NULL, ?, ?, ?, ?, ?, ?, ?)");
        $query->bind_param("sssssss", $_REQUEST['Nr'], $_REQUEST['DataZ'], $_REQUEST['Okres'], $_REQUEST['Przedmiot'], $_REQUEST['wartosc'], $_SESSION['nick'], $_REQUEST['dokument']);
        $query->execute();
        $GLOBALS['smarty']->assign('dodum', "Wprowadź poprawne dane klienta");
        $GLOBALS['smarty']->assign('sukces', "Dodano umowę");
        $GLOBALS['smarty']->display("umowyO.tpl");
    }
}
function processuu()
{
    if (password_verify($_REQUEST['adminPass'], $GLOBALS['adminPass'])) {
        $query = $GLOBALS['db']->prepare("SELECT * FROM umowy WHERE nr =?");
        $query->bind_param("s", $_REQUEST['nr']);
        $query->execute();
        $result = $query->get_result();
        if ($result->num_rows == 0) {
            $GLOBALS['smarty']->assign('usuum', "Wprowadź poprawne dane klienta");
            $GLOBALS['smarty']->assign('blad', "Umowa o tym numerze nie istnieje w bazie danych");
            $GLOBALS['smarty']->display("umowy.tpl");
        } elseif ($result->num_rows == 1) {
            $query = $GLOBALS['db']->prepare("DELETE FROM umowy WHERE nr =?");
            $query->bind_param("s", $_REQUEST['nr']);
            $query->execute();
            $GLOBALS['smarty']->assign('usuum', "Wprowadź poprawne dane klienta");
            $GLOBALS['smarty']->assign('sukces', "Usunięto umowę");
            $GLOBALS['smarty']->display("umowy.tpl");
        }
    } else {
        $GLOBALS['smarty']->assign('usuum', "Wprowadź poprawne dane klienta");
        $GLOBALS['smarty']->assign('blad', "Nie jesteś uprawniony do usuwania umów");
        $GLOBALS['smarty']->display('umowyO.tpl');
    }
}
function szczegolyKlienta()
{
    //Dane ogólne klienta
    $query = $GLOBALS['db']->prepare("SELECT * FROM klienci where dokument= ? ");
    $query->bind_param("s", $_REQUEST['dokument']);
    $query->execute();
    $result = $query->get_result();
    if ($result->num_rows == 0) {
        listaKlientow();
        $GLOBALS['smarty']->assign('blad', "Nie wybrano klienta");
        $GLOBALS['smarty']->display('klienci.tpl');
    } else {
        $wsk = array();
        while ($row = $result->fetch_assoc()) {
            array_push($wsk, $row);
        }
        $GLOBALS['smarty']->assign('wsk', $wsk);
        //zawarte umowy
        $query = $GLOBALS['db']->prepare("SELECT * FROM umowy where klientID= ? ");
        $query->bind_param("s", $_REQUEST['dokument']);
        $query->execute();
        $result = $query->get_result();
        $zawarteUmowy = array();
        while ($row = $result->fetch_assoc()) {
            array_push($zawarteUmowy, $row);
        }
        $GLOBALS['smarty']->assign('zawarteUmowy', $zawarteUmowy);
    }
}
function processdk()
{
    $query = $GLOBALS['db']->prepare("SELECT * FROM klienci WHERE dokument =?");
    $query->bind_param("s", $_REQUEST['dokument']);
    $query->execute();
    $result = $query->get_result();
    if ($result->num_rows == 1) {
        $GLOBALS['smarty']->assign('dodkl', "Wprowadź poprawne dane klienta");
        $GLOBALS['smarty']->assign('blad', "Klient posługujący się tym dokumentem istnieje w bazie danych");
        $GLOBALS['smarty']->display("klienciO.tpl");
    } else {
        $query = $GLOBALS['db']->prepare("INSERT INTO klienci (id, imieNazwisko, dokument, adres, userID) VALUES (NULL, ?, ?, ?, ?)");
        $query->bind_param("ssss", $_REQUEST['imieNazwisko'], $_REQUEST['dokument'], $_REQUEST['adres'], $_SESSION['nick']);
        $query->execute();
        $GLOBALS['smarty']->assign('dodkl', "Wprowadź poprawne dane klienta");
        $GLOBALS['smarty']->assign('sukces', "Dodano klienta");
        $GLOBALS['smarty']->display("klienciO.tpl");
    }
}
function processuk()
{
    if (password_verify($_REQUEST['adminPass'], $GLOBALS['adminPass'])) {
        $query = $GLOBALS['db']->prepare("SELECT * FROM klienci WHERE dokument =?");
        $query->bind_param("s", $_REQUEST['dokument']);
        $query->execute();
        $result = $query->get_result();
        if ($result->num_rows == 0) {
            $GLOBALS['smarty']->assign('usukl', "Wprowadź poprawne dane klienta");
            $GLOBALS['smarty']->assign('blad', "Klient posługujący się tym dokumentem nie istnieje w bazie danych");
            $GLOBALS['smarty']->display("klienciO.tpl");
        } elseif ($result->num_rows == 1) {
            $query = $GLOBALS['db']->prepare("DELETE FROM klienci WHERE dokument =?");
            $query->bind_param("s", $_REQUEST['dokument']);
            $query->execute();
            $GLOBALS['smarty']->assign('usukl', "Wprowadź poprawne dane klienta");
            $GLOBALS['smarty']->assign('sukces', "Usunięto klienta");
            $GLOBALS['smarty']->display("klienciO.tpl");
        }
    } else {
        $GLOBALS['smarty']->assign('usukl', "Wprowadź poprawne dane klienta");
        $GLOBALS['smarty']->assign('blad', "Nie jesteś uprawniony do usuwania klientów");
        $GLOBALS['smarty']->display('klienciO.tpl');
    }
}
//START KODU APLIKACJI
if (isset($_SESSION['nick'])) {
    $smarty->assign('nick', $_SESSION['nick']);
}
if (isset($_REQUEST['action'])) {

    switch ($_REQUEST['action']) {
        case 'gologin':
            $smarty->display('login.tpl');
            break;
        case 'processLogin': //logowanie się
            processlogin();
            break;
        case 'goregister':
            $smarty->display('register.tpl');
            break;
        case 'processRegister': // zakładanie konta dla pracownika
            processregister();
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
            daneumowy();
            break;
        case 'du':
            $smarty->assign('dodum', "Wprowadź poprawne dane umowy");
            listaKlientow();
            $smarty->display('umowyO.tpl');
            break;
        case 'processDU': //dodawanie umowy
            processdu();
            break;
        case 'uu':
            $smarty->assign('usuum', "Wprowadź poprawne dane umowy");
            $smarty->display('umowyO.tpl');
            break;
        case 'processUU': //usuwanie umowy
            processuu();
            break;
        case 'klienci': // lista klientów
            listaKlientow();
            $smarty->display('klienci.tpl');
            break;
        case 'wsk':
            szczegolyKlienta();
            //wybór klienta
            listaKlientow();
            $smarty->display('klientinfo.tpl');
            break;
        case 'dk':
            $smarty->assign('dodkl', "Wprowadź poprawne dane klienta");
            $smarty->display('klienciO.tpl');
            break;
        case 'processDK': //dodwanie klienta
            processdk();
            break;
        case 'uk':
            $smarty->assign('usukl', "Wprowadź poprawne dane klienta");
            $smarty->display('klienciO.tpl');
            break;
        case 'processUK': // usuwanie klienta
            processuk();
            break;
    }
} else {
    $smarty->display('index.tpl');
}
