<?php
session_start();

?>

<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Barangay Sto. Tomas</title>
	<link rel="stylesheet" href="css/home.css">
	<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link href="assets/img/logo.png" rel="icon" type="image/x-icon">
 <style>
    @import url("https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap");

    * {
        margin: 0px;
        padding: 0px;
        box-sizing: border-box;
        font-family: "Poppins", "sans-serif";
    }
    .row1 {
    display: inline-block;
    margin: 30px;
    text-align: center;
    justify-content: space-between;
    align-items: center;
    width: 350px;
    height: 200px;
    }
    .row2 {
    display: inline-block;
    margin: 30px;
    text-align: center;
    justify-content: space-between;
    align-items: center;
    width: 350px;
    height: 200px;
    }
    .row3 {
    display: inline-block;
    margin: 30px;
    text-align: center;
    justify-content: space-between;
    align-items: center;
    width: 350px;
    height: 200px;
    }

    nav {
        display: flex;
        justify-content: space-around;
        background-color: #EEFBFB;
        align-items: center;
        min-height: 8vh;
        font-size: 20px;
        font-weight: 550;
        box-shadow: 0 0 1px rgba(0, 0, 0, 0.2);
    }

    .logo {
        color: rgb(0, 0, 0);
        text-transform: uppercase;
        letter-spacing: 2px;
        font-size: 20px;
        cursor: pointer;
    }

    .nav-links {
        display: flex;
        justify-content: space-around;
        width: 30%;
    }

    .nav-links li {
        list-style-type: none;
        margin: 10px;
    }

    .nav-links a {
        color: rgb(0, 0, 0);
        text-decoration: none;
        letter-spacing: 3px;
        font-weight: bold;
        font-size: 14px;
    }

    .nav-links a:hover {
        color: #203647;
    }

    .burger {
        display: none;
        cursor: pointer;
    }

    .burger div {
        width: 25px;
        height: 3px;
        background-color: rgb(0, 0, 0);
        margin: 5px;
        transition: all 0.3s ease;
    }

    main {
        background-image: url(img/bg.png);
        background-repeat: no-repeat;
        background-size: cover;
        background-position: center;
    }

    .home {
        display: flex;
        width: 90%;
        margin: auto;
        min-height: 80vh;
        align-items: center;
    }

    .intro {
        flex: 1;
    }

    .intro-text h1 {
        font-size: 45px;
        font-weight: 600;
        background: linear-gradient(to right, #EEFBFB, #a4d5f3);
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
    }

    .intro-text p {
        margin-top: 5px;
        font-size: 22px;
        color: #EEFBFB;
    }

    .more {
        padding: 25px 0px 25px 0px;
    }

    .smore {
        background: #0065A3;
        width: 150px;
        height: 50px;
        cursor: pointer;
        font-size: 16px;
        border: none;
        color: white;
    }

    .brgy {
        flex: 1;
        display: flex;
        justify-content: center;
        height: 60vh;
    }

    .brgy img {
        height: 100%;
        filter: drop-shadow(0px 5px 3px black);
        animation: drop 1.5s ease;
    }

    .services {
        margin-top: 1rem;
        margin-bottom: 1rem;
    }

    .slider-wrapper {
        position: relative;
        margin: 0 auto;
    }

    .slider {
        display: flex;
        aspect-ratio: 2.3 / 1;
        overflow-x: auto;
        scroll-snap-type: x mandatory;
        scroll-behavior: smooth;
        box-shadow: 0 1.5rem 3rem -0.75rem hsla(0, 0%, 0%, 0.25);
        -ms-overflow-style: none;
        scrollbar-width: none;
    }

    .slider::-webkit-scrollbar {
        display: none;
    }

    .slider img {
        flex: 1 0 100%;
        scroll-snap-align: start;
        object-fit: cover;
    }

    .slider-nav {
        display: flex;
        column-gap: 1rem;
        position: absolute;
        bottom: 1.25rem;
        left: 50%;
        transform: translateX(-50%);
        z-index: 1;
    }

    .slider-nav a {
        width: 0.5rem;
        height: 0.5rem;
        border-radius: 50%;
        background-color: #fff;
        opacity: 0.75;
        transition: opacity ease 250ms;
    }

    .slider-nav a:hover {
        opacity: 1;
    }

    .map {
        margin-bottom: 1rem;
    }

    .map-wrapper {
        align-items: center;
        width: 100%;
        height: 100vh;
        display: flex;
        justify-content: center;
        flex-direction: column;
    }

    .map-wrapper .img {
        color: #707070;
    }

    .map-wrapper h2 {
        padding-top: 5px;
        padding-bottom: 5px;
    }

    .map-wrapper h3 {
        color: #707070;
        padding: 10px;
    }

    .about-us {
        margin-bottom: 1rem;
        height: 85vh;
        display: flex;
    }

    .aus {
        height: 10vh;
    }

    .about-fb {
        width: 50%;
        height: 95vh;
        display: flex;
        justify-content: center;
        align-items: center;
        text-align: center;
    }

    .about-pages {
        width: 50%;
        height: fit-content;
    }

    .about-pages div {
        height: 20vh;
        display: flex;
        flex-direction: column;
        justify-content: space-around;
        align-items: center;
    }

    .about-pages div>p {
        width: 80%;
        font-size: 18px;
        line-height: 20px;
        text-align: center;
    }

    .officials {
        margin-bottom: 1rem;
        background-color: #EEFBFB;
    }

    .img-title{
        margin-top: 2rem;
    }


    .offcon {
        align-items: center;
        width: 100%;
        display: flex;
        justify-content: center;
        flex-direction: column;
    }

    .offcon img{
        border-radius: 50%;
        width: 200px;
        height: 200px;
    }

    .pic-center{
        display: inline-block;
        margin: 30px;
        text-align: center;
        justify-content: space-between;
        align-items: center;
        max-width: 100%;
    }

    .row1,
    .row2,
    .row3{
        display: inline-block;
        margin: 30px;
        text-align: center;
        justify-content: space-between;
        align-items: center;
        max-width: 100%;
    }

    footer{
        bottom: 0;
        left: 0;
        right: 0;
        background: #203647;
        height: auto;
        width: 100vw;
        padding-top: 40px;
        color: #fff;
    }
    .footer-content{
        display: flex;
        align-items: center;
        justify-content: center;
        flex-direction: column;
        text-align: center;
    }
    .footer-content h3{
        font-size: 1.8rem;
        font-weight: 400;
        text-transform: capitalize;
        line-height: 3rem;
    }
    .footer-content p{
        max-width: 500px;
        margin: 10px auto;
        line-height: 28px;
        font-size: 14px;
    }
    .socials{
        list-style: none;
        display: flex;
        align-items: center;
        justify-content: center;
        margin: 1rem 0 3rem 0;
    }
    .socials li{
        margin: 0 10px;
    }
    .socials a{
        text-decoration: none;
        color: #fff;
    }
    .socials a i{
        font-size: 1.1rem;
        transition: color .4s ease;

    }
    .socials a:hover i{
        color: aqua;
    }

    .footer-bottom{
        background: #150e2b;
        padding: 20px 0;
        text-align: center;
    }
    .footer-bottom p{
        font-size: 14px;
        word-spacing: 2px;
        text-transform: capitalize;
    }

    .footer {
        height: 30vh;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    @media screen and (max-width: 1024%) {
        .nav-links {
            width: 60%;
        }

        .home {
            flex-direction: column;
        }

        .brgy img {
            padding: 1rem;
        }

        .intro {
            margin-top: 5vh;
            text-align: center;
        }

        .intro-text h1 {
            font-size: 30px;
        }

        .intro-text p {
            font-size: 18px;
        }

        .more {
            padding: 10px 0px 0px 0px;
        }

        .brgy img {
            height: 50%;
        }

        .about-us {
            display: flex;
        }

        .officials {
            flex-direction: column;
            display: inline-block;
        }
    }

    @media screen and (max-width: 768px) {
        body {
            overflow-x: hidden;
        }

        .brgy img {
            padding: 2rem;
        }

        .nav-links {
            position: absolute;
            right: 0px;
            height: 92vh;
            top: 8vh;
            background-color: rgba(0, 0, 0, 0.5);
            display: flex;
            flex-direction: column;
            align-items: center;
            width: 100%;
            transform: translateX(100%);
            transition: transform 0.5s ease-in;
            z-index: 1;
        }

        .nav-links li {
            opacity: 0;
        }

        .nav-links a {
            color: white;

        }

        .nav-links a:hover {
            color: #203647;
        }

        .burger {
            display: block;
        }

        .home {
            flex-direction: column;
        }

        .intro {
            margin-top: 5vh;
            text-align: center;
        }

        .intro-text h1 {
            font-size: 30px;
        }

        .intro-text p {
            font-size: 18px;
        }

        .more {
            padding: 10px 0px 0px 0px;
        }

        .brgy img {
            height: 50%;
        }

        .about-us {
            display: flex;
        }

        .officials {
            display: flex;
        }

        .officials h1 {
            text-align: center;
        }
    }

    .nav-active {
        transform: translateX(0%);
    }

    @keyframes navLinkFade {
        from {
            opacity: 0;
            transform: translateX(50px);
        }

        to {
            opacity: 1;
            transform: translateX(0px);
        }
    }

    @keyframes drop {
        0% {
            opacity: 0;
            transform: translateY(-80px);
        }

        100% {
            opacity: 1;
            transform: translateY(0px);
        }
    }

    .toggle .line1 {
        transform: rotate(-45deg) translate(-5px, 6px);
    }

    .toggle .line2 {
        opacity: 0;
    }

    .toggle .line3 {
        transform: rotate(45deg) translate(-5px, -6px);
    }

 </style>
</head>

<body>
	<header>
		<nav>
			<div class="logo">
				<h4>BARANGAY STO. TOMAS</h4>
			</div>
			<ul class="nav-links">
				<li><a href="#home">HOME</a></li>
				<li><a href="#services">SERVICES</a></li>
				<li><a href="#map">MAP</a></li>
				<li><a href="#about">ABOUT</a></li>
				<li><a href="login.php">LOGIN</a></li>
			</ul>
			<div class="burger">
				<div class="line1"></div>
				<div class="line2"></div>
				<div class="line3"></div>
			</div>
		</nav>
	</header>

	<main>
		<section class="home" id="home">
			<div class="intro">
				<div class="intro-text">
					<h1>Barangay Sto. Tomas</h1>
					<p>
						The most exciting district of Biñan, Laguna, get your <br>
						opportunity to move forward together.
					</p>
				</div>
				<div class="more">
					<button class="smore">See more</button>
				</div>
			</div>
			<div class="brgy">
				<img src="/img/logo.png" alt="brgy. sto. tomas" />
			</div>
		</section>
	</main>

	<section class="services" id="services">
		<div class="slider-wrapper">
			<div class="slider">
				<img id="slide-1" src="img/online1.png" />
				<img id="slide-2" src="img/online2.png" />
				<img id="slide-3" src="img/online3.png" />
			</div>
			<div class="slider-nav">
				<a href="#slide-1"></a>
				<a href="#slide-2"></a>
				<a href="#slide-3"></a>
			</div>
	</section>

	<section class="map" id="map">
		<div class="map-wrapper">
			<i class='bx bxs-map-pin bx-flashing bx-lg'></i>
			<h3>MAP AND DIRECTIONS</h3>
			<h2>8367+FJR, Santo Tomas, Biñan, Laguna</h2>
			<iframe
				src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3866.0028977128395!2d121.05988718569277!3d14.311264340829535!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3397d7765b6efe13%3A0x5c1f442463449957!2sBRGY.%20STO.%20TOMAS%20CITY%20HALL!5e0!3m2!1sen!2sph!4v1673092846980!5m2!1sen!2sph"
				width="100%" height="450" style="border:0;" allowfullscreen="" loading="lazy"
				referrerpolicy="no-referrer-when-downgrade"></iframe>
		</div>
	</section>

	<section class="about-us" id="about">
		<div class="about-pages">
			<div class="aus">
				<h1>ABOUT US</h1>
				<p>
					Barangay Sto tomas is a barangay in the City of Biñan in Laguna. A population of almost 50,000 is
					residing in Barangay Sto Tomas.
				</p>
			</div>
			<div>
				<h3>Mission</h3>
				<p>To have an environmental friendly livelihood programs that will help tighten the promotion of
					education, and
					livelihood programs that will resolve the need of the people for the progressive and strong
					community.</p>
			</div>
			<div>
				<h3>Vision</h3>
				<p>A prosperous barangay maintaining the beauty of nature, with extensive insight for the future of
					united
					individuals and serving with fear of God, loving the motherland and with confidence in dealing with
					a global changes of life.</p>
			</div>
		</div>
		<div class="about-fb">
			<div class="abt right">
				<h2>FB PAGE</h2>
				<iframe
					src="https://www.facebook.com/plugins/page.php?href=https%3A%2F%2Fweb.facebook.com%2Fbstbinanmain&tabs=timeline&width=340&height=500&small_header=false&adapt_container_width=true&hide_cover=false&show_facepile=true&appId"
					width="340" height="600" style="border:none;overflow:hidden" scrolling="no" frameborder="0"
					allowfullscreen="true"
					allow="autoplay; clipboard-write; encrypted-media; picture-in-picture; web-share"></iframe>
			</div>
		</div>
	</section>

	<section class="officials">
		<div class="offcon">
			<h1 class="img-title">Barangay Sto. Tomas Officials</h1>
			<div class="pic-center">
				<img src="assets/img/sample.png"/>
				<h3>VANESA ZABALLA ZAPATA</h3>
				<p>Barangay Captain</p>
			</div>
			<div>
				<div class="row1">
					<img src="assets/img/sample.png"/>
					<h3>JESUS DEJAN ROMANTIGUE</h3>
					<p>Barangay Kagawad</p>
				</div>
				<div class="row1">
					<img src="assets/img/sample.png"/>
					<h3>ELIZABETH RECANA AQUINO</h3>
					<p>Barangay Kagawad</p>
				</div>
				<div class="row1">
					<img src="assets/img/sample.png"/>
					<h3>DIONISIO VISTA BASMAYOR JR.</h3>
					<p>Barangay Kagawad</p>
				</div>
			</div>
			<div>
				<div class="row2">
					<img src="assets/img/sample.png"/>
					<h3>RESTITUTO DEL ROSARIO MANARIN</h3>
					<p>Barangay Kagawad</p>
				</div>
				<div class="row2">
					<img src="assets/img/sample.png"/>
					<h3>AMANDA MAGDARAOG DIMARANAN</h3>
					<p>Barangay Kagawad</p>
				</div>
				<div class="row2">
					<img src="assets/img/sample.png"/>
					<h3>NEIL DE MESA BAUTISTA</h3>
					<p>Barangay Kagawad</p>
				</div>
			</div>
			<div>
				<div class="row3">
					<img src="assets/img/sample.png"/>
					<h3>EDUARDO DIMARANAN SALAZAR</h3>
					<p>Barangay Kagawad</p>
				</div>
				<div class="row3">
					<img src="assets/img/sample.png"/>
					<h3>KIMHEA NICOLE BERMEJO GUZMAN</h3>
					<p>SK Chairman</p>
				</div>
				<div class="row3">
					<img src="assets/img/sample.png"/>
					<h3>RODEL CUNACO GONZALES</h3>
					<p>Secretary</p>
				</div>
			</div>
		</div>


	</section>

	<footer>
        <div class="footer-content">
            <h3>Barangay Sto. Tomas</h3>
            <p>A Barangay that is God-centered, competent, orderly, honest, peaceful, credible, 
				gender responsive and abides the Code of Conduct.</p>
			<p>contact us here: bsmsstotomas@gmail.com</p>
            <ul class="socials">
                <li><a href="https://web.facebook.com/bstbinanmain/" target="_blank"><i class="fa fa-facebook"></i></a></li>
            </ul>
        </div>
        <div class="footer-bottom">
            <p>copyright &copy; Barangay Sto. Tomas</p>
        </div>
    </footer>

	<script src="https://cdnjs.cloudflare.com/ajax/libs/ScrollMagic/2.0.8/ScrollMagic.min.js"></script>
	<script>
                const navSlide = () => {
            const burger = document.querySelector('.burger');
            const nav = document.querySelector('.nav-links');
            const navLinks = document.querySelectorAll('.nav-links li')

            burger.addEventListener('click', () => {
                nav.classList.toggle('nav-active');
                navLinks.forEach((link, index) => {
                    if (link.style.animation) {
                        link.style.animation = '';
                    } else {
                        link.style.animation = `navLinkFade 0.5s ease forwards ${index / 7 + 0.3}s`;
                    }
                });
                burger.classList.toggle('toggle');
            });
        }
        navSlide();
    </script>


</body>

</html>