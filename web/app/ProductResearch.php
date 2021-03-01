<html>
<?php
	$baseUrl = 'http://api_produit:5000/api/gestion_produit';
	
	function getBaseUrl(){
		return 'http://api_produit:5000/api/gestion_produit';
	}
?>
	<head>
		<meta charset="UTF-8" />
		<link rel="stylesheet" href="static/css/artonys.css" media="screen" type="text/css" />
		<link href='static/css/productPage.css' rel='stylesheet'/>
		<link href='static/css/store.css' rel='stylesheet'/>
		<script src="static/js/store.js" async></script>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="https://mdbootstrap.com/previews/ecommerce-demo/css/mdb-pro.min.css">
		<title>Produit</title>
	</head>
	
	<body>
		<header>
			<!-- Navbar (sit on top) -->
			<div class="artonys-top">
				<div class="artonys-bar artonys-white artonys-card" id="myNavbar">
					<a href="index.php" class="artonys-bar-item artonys-button artonys-wide">ARTONYS</a>		
		
					<div id='FilterBarProduct'>
						<!--recherche categories dans BDD via api-->
						<form method='POST' action ='' id='categorySelect'>
							<input type='hidden' name='apiUrlCat' value='/getProductByCategory'/>
							<select id='dropdownCategory' name='category'>
								<?php
									$curl = curl_init();
									$opts = [
										CURLOPT_URL => $baseUrl . "/getAllCategories",
										CURLOPT_RETURNTRANSFER => true,
									];
									curl_setopt_array($curl, $opts);
									$response = json_decode(curl_exec($curl));
									if(curl_getinfo($curl,CURLINFO_HTTP_CODE) == 200){
										for($i = 0; $i < count($response); $i++){
											echo "<option value='" . $response[$i]->{"id"} . "'>" . $response[$i]->{"nom"} . "</option>";
										}
									}
								?>
							</select>
							<input type='submit' name='submitCat' value='rechercher'/>
						</form>


						<!--recherche article dans BDD via api-->
						<form method='POST' action='' id='searchProductForm'>
							<input type='hidden' name='apiUrl' value='/getProductByName'/>
							<input id='searchBar' type="text" name='name' placeholder='Produit' value="<?php if(isset($_POST['name'])) echo $_POST['name'];?>" />
							<input id='ButtonSearchBar' type="submit" value='Rechercher' name='submitButton'/>
						</form>
					</div>
					
					<!-- Right-sided navbar links -->
					<div class="artonys-right artonys-hide-small">
						<a href="#cart" class="artonys-bar-item artonys-button waves-effect">
							<span class="badge badge-pill red"></span>
							<i class="fa fa-shopping-cart"></i>
						</a>
						<a href="sign_in.php" class="artonys-bar-item artonys-button"><i class="fa fa-sign-in"></i> SIGN IN</a>
						<a href="create_account.php" class="artonys-bar-item artonys-button"><i class="fa fa-user-plus"></i> CREATE ACCOUNT</a>
					</div>
				</div>
			</div>
		</header>
	
		<br><br><br><br><br><br>
		<div id='ProductContainer'> <!--display products on page-->
			<?php //display all product on page loading
				if(!isset($_POST['submitButton']) && !isset($_POST['submitCat']))
					displayAllProducts();
			?>
			
		</div>
		<section class="container content-section" id="cart">
			<h2 class="section-header">CART</h2>
			<div class="cart-row">
				<span class="cart-item cart-header cart-column">ITEM</span>
				<span class="cart-price cart-header cart-column">PRICE</span>
				<span class="cart-quantity cart-header cart-column">QUANTITY</span>
			</div>
			<div class="cart-items">
			</div>
			<div class="cart-total">
				<strong class="cart-total-title">Total</strong>
				<span class="cart-total-price">€0</span>
			</div>
			<button class="btn btn-primary btn-purchase" type="button">PURCHASE</button>
		</section>
			

	
		<?php //script for retriving product in DB via api / curl
			if(isset($_POST['submitButton'])){
				if($_POST['name'] == "")
					displayAllProducts();
				else {
					$apiAddr = $baseUrl . $_POST['apiUrl'] . "?name=" . $_POST['name'];
				
					$curl = curl_init();
					
					$opts = [
						CURLOPT_URL => $apiAddr,
						CURLOPT_RETURNTRANSFER => true,
					];
					
					curl_setopt_array($curl, $opts);
					
					$response = json_decode(curl_exec($curl));
					
					switch(curl_getinfo($curl,CURLINFO_HTTP_CODE)){
						case 200:
							echo "
							<script type='text/javascript'>document.getElementById('ProductContainer').innerHTML =''
							</script>
							";				
							
							for($i = 0; $i < count($response); $i++){
								$productDisplay = '<div class="divProduct"><div class="productTitle">' . $response[$i]->{'nom'} . '</div><div><img src="data:image/png;base64, ' . $response[$i]->{'image'} . '"/></div><div class="productPrice">' . $response[$i]->{'prix'} . '<br>€</div></div>';
								$jsComponent = "<script type='text/javascript'>var container = document.getElementById('ProductContainer');container.innerHTML += '" . $productDisplay . "';</script>";
								echo $jsComponent;
							}
							break;
							
						default:
							$tmpDiv = '<div class="noProductFound">Aucun produit ne correspond à votre recherche</div>';
							$jsComponent = "<script type='text/javascript'>var container = document.getElementById('ProductContainer');container.innerHTML += '" . $tmpDiv . "';</script>";
							echo $jsComponent;
					}
					
					curl_close($curl);
				}
			}
		?>


		<?php //script for retriving products corresponding to a category in DB via api / curl
			if(isset($_POST['submitCat'])){
				$apiAddr = $baseUrl . $_POST['apiUrlCat'] . "?category=" . $_POST['category'];
				$curl = curl_init();		
				$opts = [
					CURLOPT_URL => $apiAddr,
					CURLOPT_RETURNTRANSFER => true,
				];		
				curl_setopt_array($curl, $opts);	
				
				$response = json_decode(curl_exec($curl));
				
				switch(curl_getinfo($curl,CURLINFO_HTTP_CODE)){
					case 200:
						echo "<script type='text/javascript'>document.getElementById('ProductContainer').innerHTML =''</script>";				
						
						for($i = 0; $i < count($response); $i++){
							$productDisplay = '<div class="divProduct"><div class="productTitle">' . $response[$i]->{'nom'} . '</div><div><img class="productImage" src="data:image/png;base64, ' . $response[$i]->{'image'} . '"/></div><div class="productPrice">' . $response[$i]->{'prix'} . '<br>€</div><button class="btn btn-primary shop-item-button" type="button">Add to Cart</button></div>';
							$jsComponent = "<script type='text/javascript'>
							var container = document.getElementById('ProductContainer');
							container.innerHTML += '" . $productDisplay . "';
							</script>";
							echo $jsComponent;
						}
						break;
						
					default:
						$tmpDiv = '<div class="noProductFound">Aucun produit ne correspond à votre recherche</div>';
						$jsComponent = "<script type='text/javascript'>
						var container = document.getElementById('ProductContainer');
							container.innerHTML += '" . $tmpDiv . "';
						</script>";
						echo $jsComponent;
				}
				
				curl_close($curl);
			}
		?>

		<?php //function to display all products in DB
			function displayAllProducts(){
				$curl = curl_init();		
				$opts = [
					CURLOPT_URL => getBaseUrl() . "/getAllProducts",
					CURLOPT_RETURNTRANSFER => true,
				];		
				curl_setopt_array($curl, $opts);	
				
				$response = json_decode(curl_exec($curl));
				if(curl_getinfo($curl,CURLINFO_HTTP_CODE) == 200){
					for($i = 0; $i < count($response); $i++){
						$productDisplay = '<div class="divProduct"><div class="productTitle">' . $response[$i]->{'nom'} . '</div><div><img class="productImage" src="data:image/png;base64, ' . $response[$i]->{'image'} . '"/></div><div class="productPrice">' . $response[$i]->{'prix'} . '<br>€</div><button class="btn btn-primary shop-item-button" type="button">Add to Cart</button></div>';
						$jsComponent = "<script type='text/javascript'>var container = document.getElementById('ProductContainer');container.innerHTML += '" . $productDisplay . "';</script>";
							echo $jsComponent;
					}
				}
			}
		?>
	</body>
</html>