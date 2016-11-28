<?php
// DIC configuration

$container = $app->getContainer();

// view renderer
$container['renderer'] = function ($c) {
    $settings = $c->get('settings')['renderer'];
    return new Slim\Views\PhpRenderer($settings['template_path']);
};

// monolog
$container['logger'] = function ($c) {
    $settings = $c->get('settings')['logger'];
    $logger = new Monolog\Logger($settings['name']);
    $logger->pushProcessor(new Monolog\Processor\UidProcessor());
    $logger->pushHandler(new Monolog\Handler\StreamHandler($settings['path'], $settings['level']));
    return $logger;
};

$container['db'] = function ($container) {
    $capsule = new \Illuminate\Database\Capsule\Manager;
    $capsule->addConnection($container['settings']['db']);
error_log(print_r($capsule, true));
    $capsule->setAsGlobal();
    $capsule->bootEloquent();

    return $capsule;
};

// $container['db'] = function ($c) {
//     $settings = $c->get('settings')['db'];
//     $pdo = new PDO("pgsql:host=" . $settings['host'] . ";dbname=" . $settings['dbname'] .';dbdriver'. $settings['dbdriver'] . ';port=' . $settings['port'],
//         $settings['user'], $settings['pass']);
//     $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
//     $pdo->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
//     return $pdo;
// };