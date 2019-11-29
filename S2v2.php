<?php

/*
 * Author : Suleiman Al-Othman (Social Media Account => @sulealothman)
 * Ver. 1.0
 * S2 Encryption and Decryption Algorithm method
 */

// Encryption Method
function S2Encrypt($txt, $password) {

    $textCounter = $pCounter = 0;
    $lVar = 128 - strlen($password);
    $strLength = strlen($txt);
    $result = "";

    for ($i = 0; $i < $strLength; $i++) {

        if($pCounter == strlen($password)) $pCounter = 0;
        if($textCounter == $lVar) $textCounter = 0;

        $result .= chr(((ord($txt[$i]) + ($lVar % ($textCounter + 1))) + (ord($password[$pCounter]) - $pCounter)));
        $pCounter++; $textCounter++;
    }

    return $result;

}

// Decryption Method
function S2Decrypt($txt, $password) {

    $textCounter = $pCounter = 0;
    $lVar = 128 - strlen($password);
    $strLength = strlen($txt);
    $result = "";

    for ($i = 0; $i < $strLength; $i++) {

        if($pCounter == strlen($password)) $pCounter = 0;
        if($textCounter == $lVar) $textCounter = 0;

        $result .= chr(((ord($txt[$i]) - ($lVar % ($textCounter + 1))) - (ord($password[$pCounter]) - $pCounter)));
        $pCounter++; $textCounter++;
    }

    return $result;

}

// Example text
$text = 'Suleiman Al-Othman';

// Using encryption method
$enc = S2Encrypt($text, 'sulealothman');

// Using decryption method
$dec = S2Decrypt($enc, 'sulealothman');

// show result for encryption and decryption methods
echo $text . '<br />' . $enc . '<br />' . $dec;