<!DOCTYPE html>
<html lang="fr">
	<head>
		<meta charset="UTF-8" />
		<link rel="stylesheet" href="static/css/artonys.css" media="screen" type="text/css" />
		<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		<title>ARTONYS</title>
	</head>
	<style>
		body,h1,h2,h3,h4,h5,h6 {font-family: "Raleway", sans-serif}

		body, html {
			height: 100%;
			line-height: 1.8;
		}

		/* Full height image header */
		.bgimg-1 {
			background-position: center;
			background-size: cover;
			background-image: url("/img/home.gif");
			min-height: 100%;
		}

		.artonys-bar .artonys-button {
			padding: 16px;
		}
	</style>
	<body>
		<!-- Navbar (sit on top) -->
		<div class="artonys-top">
			<div class="artonys-bar artonys-white artonys-card" id="myNavbar">
				<a href="#home" class="artonys-bar-item artonys-button artonys-wide">ARTONYS</a>
				<!-- Right-sided navbar links -->
				<div class="artonys-right artonys-hide-small">
					<a href="#about" class="artonys-bar-item artonys-button"><i class="fa fa-question-circle"></i> ABOUT</a>
					<a href="#team" class="artonys-bar-item artonys-button"><i class="fa fa-user"></i> TEAM</a>
					<a href="sign_in.php" class="artonys-bar-item artonys-button"><i class="fa fa-sign-in"></i> SIGN IN</a>
					<a href="create_account.php" class="artonys-bar-item artonys-button"><i class="fa fa-user-plus"></i> CREATE ACCOUNT</a>
				</div>
					<!-- Hide right-floated links on small screens and replace them with a menu icon -->

				<a href="javascript:void(0)" class="artonys-bar-item artonys-button artonys-right artonys-hide-large artonys-hide-medium" onclick="artonys_open()">
					<i class="fa fa-bars"></i>
				</a>
			</div>
		</div>
		<!-- Sidebar on small screens when clicking the menu icon -->
		<nav class="artonys-sidebar artonys-bar-block artonys-black artonys-card artonys-animate-left artonys-hide-medium artonys-hide-large" style="display:none" id="mySidebar">
			<a href="javascript:void(0)" onclick="artonys_close()" class="artonys-bar-item artonys-button artonys-large artonys-padding-16">Close ×</a>
			<a href="#about" onclick="artonys_close()" class="artonys-bar-item artonys-button">ABOUT</a>
			<a href="#team" onclick="artonys_close()" class="artonys-bar-item artonys-button">TEAM</a>
			<a href="#work" onclick="artonys_close()" class="artonys-bar-item artonys-button">WORK</a>
			<a href="#pricing" onclick="artonys_close()" class="artonys-bar-item artonys-button">PRICING</a>
			<a href="#contact" onclick="artonys_close()" class="artonys-bar-item artonys-button">CONTACT</a>
		</nav>

		<!-- Header with full-height image -->
		<header class="bgimg-1 artonys-display-container artonys-grayscale-min" style="bgimg-1; background-image:url('./static/images/outils.png')" id="home">
			<div class="artonys-display-left artonys-text-white" style="padding:48px">
				<p><a href="ProductResearch.php" class="artonys-button artonys-white artonys-padding-large artonys-large artonys-margin-top artonys-opacity artonys-hover-opacity-off"><b>Browse our products</b></a></p>
			</div> 
			<div class="artonys-display-bottomleft artonys-text-grey artonys-large" style="padding:24px 48px">
				<a href ="https://www.facebook.com" target="_blank"><i class="fa fa-facebook-official artonys-hover-opacity"></i></a>
				<a href ="https://www.instagram.com" target="_blank"><i class="fa fa-instagram artonys-hover-opacity"></i></a>
				<a href ="https://www.snapchat.com" target="_blank"><i class="fa fa-snapchat artonys-hover-opacity"></i></a>
				<a href ="https://www.pinterest.com" target="_blank"><i class="fa fa-pinterest-p artonys-hover-opacity"></i></a>
				<a href ="https://www.twitter.com" target="_blank"><i class="fa fa-twitter artonys-hover-opacity"></i></a>
				<a href ="https://www.linkedin.com" target="_blank"><i class="fa fa-linkedin artonys-hover-opacity"></i></a>
			</div>
		</header>
		<!-- About Section -->
		<div class="artonys-container" style="padding:128px 16px" id="about">
			<h3 class="artonys-center">ABOUT THE COMPANY</h3>
			<p class="artonys-center artonys-large">Key features of our company</p>
			<div class="artonys-row-padding artonys-center" style="margin-top:64px">
				<div class="artonys-quarter">
					<i class="fa fa-thumbs-up artonys-margin-bottom artonys-jumbo artonys-center"></i>
					<p class="artonys-large">Quality</p>
				</div>
				<div class="artonys-quarter">
					<i class="fa fa-heart artonys-margin-bottom artonys-jumbo"></i>
					<p class="artonys-large">Passion</p>
				</div>
				<div class="artonys-quarter">
					<i class="fa fa-diamond artonys-margin-bottom artonys-jumbo"></i>
					<p class="artonys-large">Design</p>
				</div>
				<div class="artonys-quarter">
					<i class="fa fa-cog artonys-margin-bottom artonys-jumbo"></i>
					<p class="artonys-large">Support</p>
				</div>
			</div>
		</div>
		<!-- Team Section -->
		<div class="artonys-container" style="padding:128px 16px" id="team">
			<h3 class="artonys-center">THE TEAM</h3>
			<p class="artonys-center artonys-large">The ones who runs this company</p>
			<div class="artonys-row-padding artonys-grayscale" style="margin-top:64px">
				<div class="artonys-col l3 m6 artonys-margin-bottom">
					<div class="artonys-card">
						<div class="artonys-container">
							<h3>Arthur GOY</h3>
							<p class="artonys-opacity">Back-end engineer</p>
							<p><button class="artonys-button artonys-light-grey artonys-block"><i class="fa fa-envelope"></i> Contact</button></p>
						</div>
					</div>
				</div>
				<div class="artonys-col l3 m6 artonys-margin-bottom">
					<div class="artonys-card">
						<div class="artonys-container">
							<h3>Tony LY</h3>
							<p class="artonys-opacity">Web Designer</p>
							<p><button class="artonys-button artonys-light-grey artonys-block"><i class="fa fa-envelope"></i> Contact</button></p>
						</div>
					</div>
				</div>
				<div class="artonys-col l3 m6 artonys-margin-bottom">
					<div class="artonys-card">
						<div class="artonys-container">
							<h3>Yannis MOUALEM</h3>
							<p class="artonys-opacity">Back-end engineer</p>
							<p><button class="artonys-button artonys-light-grey artonys-block"><i class="fa fa-envelope"></i> Contact</button></p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Footer -->
		<footer class="artonys-center artonys-black artonys-padding-64">
			<a href="#home" class="artonys-button artonys-light-grey"><i class="fa fa-arrow-up artonys-margin-right"></i>To the top</a>
			<div class="artonys-xlarge artonys-section">
				<a href ="https://www.facebook.com" target="_blank"><i class="fa fa-facebook-official artonys-hover-opacity"></i></a>
				<a href ="https://www.instagram.com" target="_blank"><i class="fa fa-instagram artonys-hover-opacity"></i></a>
				<a href ="https://www.snapchat.com" target="_blank"><i class="fa fa-snapchat artonys-hover-opacity"></i></a>
				<a href ="https://www.pinterest.com" target="_blank"><i class="fa fa-pinterest-p artonys-hover-opacity"></i></a>
				<a href ="https://www.twitter.com" target="_blank"><i class="fa fa-twitter artonys-hover-opacity"></i></a>
				<a href ="https://www.linkedin.com" target="_blank"><i class="fa fa-linkedin artonys-hover-opacity"></i></a>
			</div>
		</footer>
		
		<script>
			// Modal Image Gallery
			function onClick(element) {
				document.getElementById("img01").src = element.src;
				document.getElementById("modal01").style.display = "block";
				var captionText = document.getElementById("caption");
				captionText.innerHTML = element.alt;
			}


			// Toggle between showing and hiding the sidebar when clicking the menu icon
			var mySidebar = document.getElementById("mySidebar");

			function artonys_open() {
				if (mySidebar.style.display === 'block') {
					mySidebar.style.display = 'none';
				} else {
					mySidebar.style.display = 'block';
				}
			}

			// Close the sidebar with the close button
			function artonys_close() {
				mySidebar.style.display = "none";
			}
		</script>
	</body>
</html>