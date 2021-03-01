<html>
	
	<link href='static/css/CommandPage.css' rel='stylesheet'/>
	
	<head>
		<title>Historique Commande</title>
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
		<form id="register_form">
			<h1>Historique Commande</h1>
			<div id="error_msg"></div>
			<div>
				<input type="text" name="clientId" placeholder="clientId" id="clientId"><br>
			</div>
			<div>
				<input type="text" name="orderId" placeholder="orderId" id="orderId"><br>
			</div>
			<div>
				<button type="submit" name="test" id="test">Test</button><br><br>
			</div>
		</form>
		
	</body>
	
	<?php
		$baseUrl = 'htpp://api_historique_commande:5003/api/historiqueCommande';
		
		function getBaseUrl(){
			return 'htpp://api_historique_commande:5003/api/historiqueCommande';
		}
		
		//POUR TEST // A SUPPRIMER UNE FOIS IDENTIFICATION CREE
		$clientId= '1';
		
		function getClientId(){
			return '1';
		}
	?>
	
	
	<div id='displayCommands'>
		<?php
		if(isset($_POST['test'])){
			$curl = curl_init();
			$opts = [
				CURLOPT_URL => $baseUrl . "/getOrderInfo" . "?clientId=" . $clientId . "&orderId=",
				CURLOPT_RETURNTRANSFER => true,
			];
			curl_setopt_array($curl, $opts);
			$response = json_decode(curl_exec($curl));
			if(curl_getinfo($curl,CURLINFO_HTTP_CODE) == 200){
				for($i = 0; $i < count($response); $i++){
					echo "<div class='commandContainer'>".
						$response[$i]->{'orderId'}
					."</div>";
				}
			}
			else{
				echo "<div class='NoCommandFound'>Aucune commande pour l'instant</div>";
			}
		}	
		?>
	</div>
	
</html>