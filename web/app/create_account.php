<html>

	<?php $baseUrl = 'http://api_client:5002/api/gestion_client'; ?>

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
		<form id="register_form" method='POST' action ='http://localhost:9008/api/gestion_client/postCreateClient'>
			<h1>Register</h1>
			<div id="error_msg"></div>
			<div><input type="text" name="firstname" placeholder="First name" id="firstname"><br></div>
            <div><input type="text" name="surname" placeholder="Surname" id="surname"><br></div>
            <div><input type="text" name="address" placeholder="Address" id="address"><br></div>
            <div><input type="text" name="town" placeholder="Town" id="town"><br></div>
            <div><input type="text" name="email" placeholder="Email", id="email"/></div><br>
            <div><select type="text" name="sex", placeholder="Sex" id="sex"><option value='1'>M</option> <option value='0'>F</option> </select></div><br>
            <div><button type="submit" name="register" id="reg_btn">Create account</button><br><br></div>
			<div id="others">
				<a href="sign_in.php">Already have an account?</a>
			</div>
		</form>
		
		<?php // checks credentials of user
		
		if(isset($_POST['register'])){
			$curl = curl_init();
			$opts = [
				CURLOPT_URL => $baseUrl . "/postCreateClient",
				CURLOPT_RETURNTRANSFER => true,
			];
			curl_setopt_array($curl, $opts);
			$response = json_decode(curl_exec($curl));
			
			switch(curl_getinfo($curl,CURLINFO_HTTP_CODE)){
				case 200:
					echo "ok";
					break;
				case 400:
					echo "L'un des champs est surement vide";
					break;
			}
		}
		
	?>
		
		
	</body>
</html>
<!-- scripts 
<script src="jquery-3.2.1.min.js"></script>
<script src="static/js/script.js"></script>-->