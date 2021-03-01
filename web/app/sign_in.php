<html>

	<?php $baseUrl = 'http://api_auth:5001/api/authentification'; ?>

	<head>
		<title>Register</title>
		<link rel="stylesheet" href="static/css/style.css">
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
		
		<form method='POST' action ='http://localhost:9007/api/authentification/authentificate' id="login_form">
			<h1>Sign in</h1>
			<div>
				<input type="text" id="username" placeholder="login" name="login"><br>
			</div>
			<div>
				<input type="password" id="password" placeholder="Password" name="password"><br><br>
			</div>
			<div>
				<button type="submit" name="sign_in" id="sig_btn">Sign in</button><br><br>
			</div>
			<div id="others">
				<a href="create_account.php">Create account</button><br>
			</div>
		</form>
	</body>
	
	
	<?php // checks credentials of user
		
		if(isset($_POST['sign_in'])){
			$curl = curl_init();
			$opts = [
				CURLOPT_URL => $baseUrl . "/authentificate",
				CURLOPT_RETURNTRANSFER => true,
			];
			curl_setopt_array($curl, $opts);
			$response = json_decode(curl_exec($curl));
			
			switch(curl_getinfo($curl,CURLINFO_HTTP_CODE)){
				case 200:
					echo "ok";
					break;
				case 404:
					echo "wrong login / password";
					break;
				case 400:
					echo "User not founf";
					break;
				case 405:
					echo "Error 405";
					break;
			}
		}
		
	?>
	
</html>