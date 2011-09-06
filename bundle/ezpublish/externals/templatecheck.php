#! /usr/bin/env php
<?php
/**
 *
 * $Id$
 * $HeadURL$
 *
 */

if ( !isset( $argv[1] ) )
{
    fputs( STDERR, "No file to check\n" );
    die( 1 );
}
$file = $argv[1];
if ( !file_exists( $file ) )
{
    fputs( STDERR, 'File ' . $file . " does not exist\n" );
    die( 2 );
}
$file = preg_replace( '@/+@', '/', $file );
$pathFromRoot = dirname( $file ) . '/';

// check if we are in the eZ Publish directory
if ( !is_dir( 'kernel' ) )
{
    $dirname = $pathFromRoot;
    $pathFromRoot = '';
    chdir( $dirname );
    while ( !is_dir( 'kernel' ) )
    {
        $pathFromRoot = array_pop( explode( '/', trim( getcwd(), '/' ) ) ) . '/' . $pathFromRoot;
        chdir( '..' );
        if ( getcwd() == '/' )
        {
            fputs( STDERR, "Cannot find eZ Publish root\n" );
            die( 3 );
        }
    }
}

require 'autoload.php';

$cli = eZCLI::instance();
$script = eZScript::instance( array( 'description' => ( "eZ Publish Template Syntax Checker for eZVim plugin\n" .
                                                        "\n" .
                                                        "templatecheck.php path/to/template.tpl\n" ),
                                     'use-session' => false,
                                     'use-modules' => true,
                                     'use-extensions' => true ) );
$script->startup();
$script->initialize();
$fileRelative = $pathFromRoot . basename( $file );
$results = eZDevTools::checkTemplate( $fileRelative );
foreach( $results as $result )
{
    $cli->output( $file . ':' . $result );
}
$script->shutdown();
?>
