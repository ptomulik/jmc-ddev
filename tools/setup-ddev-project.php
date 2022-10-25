#!/usr/bin/env php
<?php

function help(array $argv) {
    return
<<<END
Usage:

$argv[0] project

    project     project name (e.g. contentiacdn)
END;
}

function find_free_port() {
    $sock = socket_create_listen(0);
    socket_getsockname($sock, $addr, $port);
    socket_close($sock);
    return $port;
}


if (count($argv) < 2) {
    fwrite(STDERR, "error: missing argument\n");
    fwrite(STDERR, "\n");
    fwrite(STDERR, help($argv));
    fwrite(STDERR, "\n\n");
    exit(1);
}
if ('--help' == $argv[1]) {
    fwrite(STDERR, help($argv));
    fwrite(STDERR, "\n\n");
    exit(2);
}

$ddevdir = dirname(__DIR__) . '/.ddev';
$ddev_config_file = $ddevdir . '/config.local.yaml';
if (file_exists($ddev_config_file)) {
    fwrite(STDERR, "error: {$ddev_config_file} already exists\n");
    exit(1);
}

$ddev_config['name'] = $argv[1];
$ddev_config['additional_hostnames'] = [
    "*." . $argv[1],
];


fwrite(STDERR, "Writting config file: {$ddev_config_file}\n");
yaml_emit_file($ddev_config_file, $ddev_config);
