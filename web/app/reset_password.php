<!DOCTYPE html>
<html lang="fr">
	<head>
		<meta charset="UTF-8" />
		<link rel="stylesheet" href="static/css/style.css">
		<title>Reset password</title>
	</head>
	<body>
		<header>
			<!-- Navbar (sit on top) -->
			<div class="artonys-top">
				<div class="artonys-bar artonys-white artonys-card" id="myNavbar">
					<a href="index.php" class="artonys-bar-item artonys-button artonys-wide">ARTONYS</a>
				</div>
			</div>
		</header>
		<form id="password_form">
			<h1>Reset password</h1>
			<div>
				<label for="password">Password</label><br>
				<input type="password" id="password" placeholder="New password" name="username" minlength="8"><br>
			</div>
			<div>
				<input type="password" id="password" placeholder="Confirm new password" name="password" minlength="8"><br><br>
			</div>
			<div>
				<button type="button" name="sign_in" id="con_btn">Confirm</button><br><br>
			</div>
		</form>
	</body>
</html>