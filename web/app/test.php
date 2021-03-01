<html>

<?php
	//API call GET sans parametre
	$apiAddr = "http://127.0.0.1:5000/api/gestion_produit/getAllCategories";
	$curl = curl_init();
	
	$opts = [
		CURLOPT_URL => $apiAddr,
		CURLOPT_RETURNTRANSFER => true,
	];
	
	curl_setopt_array($curl, $opts);
	
	/*$response = json_decode(curl_exec($curl));
	curl_close($curl);
	
	print_r($response);
	echo "///////////";
	echo $response[0]->{'nom'};*/
?>


<?php
	//API call GET avec parametre
	$apiAddr = "http://127.0.0.1:5000/api/gestion_produit/getProductByName?name=vis";
	$curl = curl_init();
	
	$opts = [
		CURLOPT_URL => $apiAddr,
		CURLOPT_RETURNTRANSFER => true,
	];
	
	curl_setopt_array($curl, $opts);
	
	/*$response = json_decode(curl_exec($curl));
	curl_close($curl);
	
	print_r($response);
	echo "/////////// ";
	echo $response[0]->{'nom'};*/
?>


<?php
	//API call POST
	$apiAddr = "http://127.0.0.1:5000/api/gestion_produit/postCategory";
	$curl = curl_init();
	
	$params = [
		'name' => 'a sppr'
	];
	
	$paramString = http_build_query($params);
	
	$opts = [
		CURLOPT_URL => $apiAddr,
		CURLOPT_RETURNTRANSFER => true,
		CURLOPT_POST => true,
		CURLOPT_POSTFIELDS => $paramString
	];
	
	curl_setopt_array($curl, $opts);
	
	$response = json_decode(curl_exec($curl));
	
	//print_r($response);
	echo curl_getinfo($curl,CURLINFO_HTTP_CODE);
	
	curl_close($curl);
?>


</html>