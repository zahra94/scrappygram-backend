<?php
return [
    'settings' => [
        'displayErrorDetails' => true, // set to false in production
        'addContentLengthHeader' => false, // Allow the web server to send the content-length header

        // Renderer settings
        'renderer' => [
            'template_path' => __DIR__ . '/../templates/',
        ],

        // Monolog settings
        'logger' => [
            'name' => 'slim-app',
            'path' => __DIR__ . '/../logs/app.log',
            'level' => \Monolog\Logger::DEBUG,
        ],

        'db' => [
            'driver' => 'pgsql',
            'host' => 'localhost',
            'database' => 'scrappygram_dev',
            'username' => 'postgres',
            'password' => 'james',
            'charset'   => 'utf8',
            'prefix'    => '',
            'port'      => 5432,
        ]

        //  "db" => [
        //     "host"      => "locahost",
        //     "dbname"    => "scrappygram_dev",
        //     "user"      => "postgres",
        //     "pass"      => "james",
        //     'dbdriver'  => 'pdo',
        //     'port'      => 5432
        // ],
    ],
];
