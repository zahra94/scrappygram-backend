<?php

##################################
###           MODALS           ###
##################################

switch($_GET['modal']) {

    // system
    case "suppliers/edit":
        $supplier = getRowById("suppliers",$_GET['id']);
        break;

    case "suppliers/view":
        $supplier = getRowById("suppliers",$_GET['id']);
        break;

    case "labels/edit":
        $label = getRowById("labels",$_GET['id']);
        break;

    case "models/add":
        $manufacturers = getTable("manufacturers");
        break;

    case "models/edit":
        $manufacturers = getTable("manufacturers"); $model = getRowById("models",$_GET['id']);
        break;

    case "manufacturers/edit":
        $manufacturer = getRowById("manufacturers",$_GET['id']);
        break;

    case "locations/add":
        $clients = getTable("clients");
        break;

    case "locations/edit":
        $clients = getTable("clients");
        $location = getRowById("locations",$_GET['id']);
        break;

    case "assetcategories/edit":
        $category = getRowById("assetcategories",$_GET['id']);
        break;

    case "licensecategories/edit":
        $category = getRowById("licensecategories",$_GET['id']);
        break;


    // people
    case "users/add":
        $clients = getTable("clients");
        $roles = getTableFiltered("roles","type","user");
        break;

    case "staff/add":
        $roles = getTableFiltered("roles","type","admin");
        break;



    // escalation rules
    case "escalationrules/add":
        $admins = getTableFiltered("people","type","admin");
        break;

    case "escalationrules/edit":
        $rule = getRowById("tickets_rules",$_GET['id']);
        $statuses = array();
        $priorities = array();
        if($rule['cond_status'] != "") $statuses = unserialize($rule['cond_status']);
        if($rule['cond_priority'] != "") $priorities = unserialize($rule['cond_priority']);
        $admins = getTableFiltered("people","type","admin");
        break;



    // comments
    case "comments/add":
        $people = getTable("people");
        break;

    case "comments/edit":
        $comment = getRowById("comments",$_GET['id']);
        $people = getTable("people"); break;


    // contacts
    case "contacts/edit":
        $contact = getRowById("contacts",$_GET['id']);
        break;


    // notifications
    case "notifications/edit":
        $template = getRowById("notificationtemplates",$_GET['id']);
        break;


    // predefined replies
	case "preplies/edit":
        $preply = getRowById("tickets_pr",$_GET['id']);
        break;

	case "preplies/insert":
        $preplies = getTable("tickets_pr");
        break;


    // kb
    case "kb/addCategory":
        $clients = getTable("clients");
        break;

	case "kb/editCategory":
        $kbcategory = getRowById("kb_categories",$_GET['id']);
        $selectedClients = array(); if($kbcategory['clients'] != "") $selectedClients = unserialize($kbcategory['clients']);
        $clients = getTable("clients");
        break;

	case "kb/addArticle":
        $kbcategories = getTable("kb_categories");
        $clients = getTable("clients");
        break;

	case "kb/viewArticle":
        $kbarticle = getRowById("kb_articles",$_GET['id']);
        break;

	case "kb/editArticle":
        $kbarticle = getRowById("kb_articles",$_GET['id']);
        $selectedClients = array(); if($kbarticle['clients'] != "") $selectedClients = unserialize($kbarticle['clients']);
        $kbcategories = getTable("kb_categories");
        $clients = getTable("clients");
        break;


}

?>
