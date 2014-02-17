<?php
if(IN_MANAGER_MODE!="true") die("<b>INCLUDE_ORDERING_ERROR</b><br /><br />Please use the MODX Content Manager instead of accessing this file directly.");
if(!$modx->hasPermission('delete_user')) {
	$modx->webAlertAndQuit($_lang["error_no_privileges"]);
}

$id=intval($_GET['id']);

// delete the user, but first check if we are deleting our own record
if($id==$modx->getLoginUserID()) {
	$modx->webAlertAndQuit("You can't delete yourself!");
}

// get user name
$sql = "SELECT * FROM $dbase.`".$table_prefix."manager_users` WHERE $dbase.`".$table_prefix."manager_users`.id='".$id."' LIMIT 1;";
$rs = $modx->db->query($sql);
if($rs) {
	$row = $modx->db->getRow($rs);
	$username = $row['username'];
}

// invoke OnBeforeUserFormDelete event
$modx->invokeEvent("OnBeforeUserFormDelete",
						array(
							"id"	=> $id
						));

// Set the item name for logger
$_SESSION['itemname'] = $username;

//ok, delete the user.
$sql = "DELETE FROM $dbase.`".$table_prefix."manager_users` WHERE $dbase.`".$table_prefix."manager_users`.id=".$id.";";
$rs = $modx->db->query($sql);
if(!$rs) {
	$modx->webAlertAndQuit("Something went wrong while trying to delete the user...");
}

$sql = "DELETE FROM $dbase.`".$table_prefix."member_groups` WHERE $dbase.`".$table_prefix."member_groups`.member=".$id.";";
$rs = $modx->db->query($sql);
if(!$rs) {
	$modx->webAlertAndQuit("Something went wrong while trying to delete the user's access permissions...");
}

// delete user settings
$sql = "DELETE FROM $dbase.`".$table_prefix."user_settings` WHERE $dbase.`".$table_prefix."user_settings`.user=".$id.";";
$rs = $modx->db->query($sql);
if(!$rs) {
	$modx->webAlertAndQuit("Something went wrong while trying to delete the user's settings...");
}

// delete the attributes
$sql = "DELETE FROM $dbase.`".$table_prefix."user_attributes` WHERE $dbase.`".$table_prefix."user_attributes`.internalKey=".$id.";";
$rs = $modx->db->query($sql);
if(!$rs) {
	$modx->webAlertAndQuit("Something went wrong while trying to delete the user attributes...");
} else {
	// invoke OnManagerDeleteUser event
	$modx->invokeEvent("OnManagerDeleteUser",
						array(
							"userid"		=> $id,
							"username"		=> $username
						));

	// invoke OnUserFormDelete event
	$modx->invokeEvent("OnUserFormDelete",
						array(
							"id"	=> $id
						));

	$header="Location: index.php?a=75";
	header($header);
}
?>