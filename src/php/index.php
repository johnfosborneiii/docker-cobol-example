<!DOCTYPE HTML>
<html>
 <head>
  <meta charset="utf-8">
  <title>COBOL in the house!</title>
 </head>
 <body>
 <h1>HTTPD PHP COBOL Example</h1>
 <h2>This is a simple example which uses PHP running in HTTPD to call a legacy COBOL app and prints the output from COBOL below</h2>

<?php
    echo shell_exec("/johnsCOBOLapp");   //this works
?>

 </body>
</html>
