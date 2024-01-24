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
            //       case 'login':
            //         $smarty->display('login.tpl');
            //          break;
        case 'processLogin':
            $query = $db->prepare("SELECT * FROM user WHERE login = ? LIMIT 1");
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
                $smarty->display('internal.tpl');
            } else {
                $smarty->assign('error', "Błędny login lub hasło");
                $smarty->display('login.tpl');
                break;
            }
            break;
        default:
            $smarty->display('login.tpl');
    }
} else {
    $smarty->display('login.tpl');
}
