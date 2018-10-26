<?php
function thumbnail($image , $type)
{
    // We need to get extension type ( .jpeg , .png ...)
    $ext = pathinfo($image, PATHINFO_EXTENSION);
    // We remove extension from file name so we can append thumbnail type
    $num = strlen($ext)*(-1)-1;
    $name = substr($image, 0, $num);
    // We merge original name + type + extension
    return $name . '-' . $type . '.' . $ext;
}