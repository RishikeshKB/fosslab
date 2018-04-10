<html>
<head>
<title> Login Page </title>
</head>
<body>
<h1> Login </h1>
<br><br><br>
<form method = "post" >
<b>Username: <input type = "text" name = "username"><br>
Password: <input type = "password" name = "password"><br></b>
<input type = "submit" value = "Login">
<?php
if($_POST['username']=="Rishikesh" && $_POST['password']=="rishi123") {
        echo("<h2>Welcome ".$_POST['username']."</h2>");
}
else if ($_POST['username']=="Rishikesh") {
        echo("<h3>Wrong password!!</h3>");
}
else if ($_POST['password']=="rishi123") {
        echo("<h3>Wrong username!!</h3>");
}
else if (($_POST['password']!="rishi123" && $_POST['username']!="Rishikesh") && ($_POST['password']!= NULL && $_POST['username']!= NULL )){
        echo("<h3>Wrong username and password</h3>");
}
?>
</form>
</body>
</html>  
