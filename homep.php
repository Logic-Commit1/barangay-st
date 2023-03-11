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
  
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link href="img/logo.png" rel="icon" type="image/x-icon">
  <style>

        @import url("https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap");

        * {
          margin: 0;
          padding: 0;
          box-sizing: border-box;
          font-family: "Poppins", "sans-serif";
        }

        html,
        body,
        main {
          min-height: 100%;
          background-color: #EEFBFB;
          scroll-behavior: smooth;
        }

        nav {
          position: fixed;
          top: 0;
          left: 0;
          height: 70px;
          width: 100%;
          display: flex;
          align-items: center;
          background: #fff;
          box-shadow: 0 0 1px rgba(0, 0, 0, 0.1);
          z-index: 1;
        }

        nav .logo {
          display: flex;
          align-items: center;
          margin: 0 24px;
        }

        a {
          text-decoration: none;
          color: #000000;
        }

        .logo .menu-icon {
          color: #000000;
          font-size: 24px;
          margin-right: 14px;
          cursor: pointer;
        }

        .logo .logo-name {
          color: #000000;
          font-size: 22px;
          font-weight: 500;
        }

        .logo-log {
          color: #000000;
          font-size: 22px;
          font-weight: 500;
          float: right;
          margin: 0 24px;
          position: absolute;
          right: 0;
        }

        nav .sidebar {
          position: fixed;
          top: 0;
          left: -100%;
          height: 100%;
          width: 260px;
          padding: 20px 0;
          background-color: #fff;
          box-shadow: 0 5px 1px rgba(0, 0, 0, 0.1);
          transition: all 0.4s ease;
        }

        nav.open .sidebar {
          left: 0;
        }

        .sidebar .sidebar-content {
          display: flex;
          height: 100%;
          flex-direction: column;
          justify-content: space-between;
          padding: 30px 16px;
        }

        .sidebar-content .list {
          list-style: none;
        }

        .list .nav-link {
          display: flex;
          align-items: center;
          margin: 8px 0;
          padding: 14px 12px;
          border-radius: 3px;
          text-decoration: none;
        }

        .lists .nav-link:hover {
          background-color: #203647;
        }


        .nav-link .link {
          font-size: 16px;
          color: #707070;
          font-weight: 400;
        }

        .lists .nav-link:hover .link {
          color: #fff;
        }

        .overlay {
          position: fixed;
          top: 0;
          left: -100%;
          height: 1000vh;
          width: 200%;
          opacity: 0;
          pointer-events: none;
          transition: all 0.4s ease;
          background: rgba(0, 0, 0, 0.3);
        }

        nav.open~.overlay {
          opacity: 1;
          left: 260px;
          pointer-events: auto;
        }

        .home {
          background-image: url(img/bg.png);
          background-attachment: fixed;
          background-position: center;
          width: 100%;
          height: 530px;
          display: flex;
          align-items: center;
          justify-content: center;
        }

        .home h1 {
          margin: 25px 50px 25px 50px;
          color: #fff;
          text-align: center;
        }

        .home p {
          color: #fff;
          text-align: center;
        }

        ul {
          display: block;
          list-style-type: disc;
          margin-block-start: 1em;
          margin-block-end: 1em;
          margin-inline-start: 0px;
          margin-inline-end: 0px;
          padding-inline-start: 40px;
          text-align: center;
        }


        .btn .theme {
          color: white;
          background: #203647;
          font-size: 14px;
          font-weight: 700;
          line-height: 1;
          padding: 19px 47px 19px 47px;
          border: 2px solid #203647;
          display:inline-block;
          position: relative;
          cursor: pointer;
          -webkit-transition: all 0.4s ease-out 0s;
          -moz-transition: all 0.4s ease-out 0s;
          -ms-transition: all 0.4s ease-out 0s;
          -o-transition: all 0.4s ease-out 0s;
          transition: all 0.4s ease-out 0s;
        }

        @-webkit-keyframes slide_animation {
          0% {left: 0px;}
          10% {left: 0px;}
          20% {left: 890px;}
          30% {left: 890px;}
          40% {left: 1780px;}
          50% {left: 1780px;}
          60% {left: 890px;}
          70% {left: 890px;}
          80% {left: 0px;}
          90% {left: 0px;}
          100% {left: 0px;}
        }

        .container {
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

        .map-wrapper{
          align-items: center;
          width: 100%;
          height: 100vh;
          display: flex;
          justify-content: center;
          flex-direction: column;
        }

        .map-wrapper .img{
          color: #707070;
        }

        .map-wrapper h2{
          padding-top: 5px;
          padding-bottom: 5px;
        }

        .map-wrapper h3{
          color: #707070;
          padding: 10px;
        }

        .about-us{
          padding: 2rem;
          float: left;
          width: 100%;
        }

        .abt{
          float: left;
          padding: 12px;
        }

        .left{
          width: 70%;
        }

        .right {
          width: 30%;
        }

        .about-us:after {
          content: "";
          display: table;
          clear: both;
        }

        .abt p{
          padding-bottom: 10px;
          text-align: justify;
        }

        footer{
          display: -webkit-flex;
          display: -moz-flex;
          display: -ms-flex;
          display: -o-flex;
          display: flex;
          flex-flow: row wrap;
          padding: 50px;
          color: #fff;
          background-color: #203647;
        }

        .footer{
          padding: 2rem;
          width: 100%;
        }

        .column2 h3{
          font-weight: 600;
          font-size: 17px;
        }

        .column2 {
          margin-right: 1.25em;
          margin-bottom: 2em;
          text-align: justify;
          float: left;
          padding: 12px;
        }

        .column {
          float: left;
          width: 50%;
          padding: 10px;
        }

        .footer:after {
          content: "";
          display: table;
          clear: both;
        }

        .column img{
          width: 15%;
          margin: 15px;
        }

        .column2 ul{
          list-style: none;
          padding-left: 0;
        }

        .column2 li{
          line-height: 2em;
        }

        .box{
          color: #fff;
          text-align: left;
        }


  </style>
  
  
  </head>

  <body>
    <nav>
      <div class="logo">
        <i class="bx bx-menu menu-icon"></i>
        <span class="logo-name">BARANGAY STO. TOMAS</span>
      </div>

      <div class="logo-log">
        <a href="login.php" class="nav-link">
          <span>LOGIN</span>
        </a>
      </div>

      <div class="sidebar">
        <div class="logo">
          <div class="nav-link">
            <i class="bx bx-menu menu-icon"></i>
            <span class="logo-name">MENU</span>
          </div>
        </div>

        <div class="sidebar-content">
          <ul class="lists">
            <li class="list">
              <a href="#home" class="nav-link">
                <span class="link">HOME</span>
              </a>
            </li>

            <li class="list">
              <a href="#services" class="nav-link">
                <span class="link">SERVICES</span>
              </a>
            </li>

            <li class="list">
              <a href="#map" class="nav-link">
                <span class="link">MAP</span>
              </a>
            </li>

            <li class="list">
              <a href="#about" class="nav-link">
                <span class="link">ABOUT</span>
              </a>
            </li>
        </div>
      </div>
    </nav>

    <div class="home" id="home">
      <div class="content">
        
        <h1>Barangay Sto. Tomas</h1>
        <p>The most exciting district of Biñan, Laguna, get your opportunity to move forward together.</p>
       
        <div class="btnc">
          <ul class="btn">
            <li class="theme">
              See more
            </li>
          </ul>
        </div>
      </div>
    </div>

    <div class="container" id="services">
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
      </div>

      <div class="btnc">
        <ul class="btn">
          <li class="theme">
            Click here to apply
          </li>
        </ul>
      </div>
    </div>

    <div class="map-wrapper" id="map">
      <i class='bx bxs-map-pin bx-flashing bx-lg'></i>
      <h3>MAP AND DIRECTIONS</h3>
      <h2>8367+FJR, Santo Tomas, Biñan, Laguna</h2>
      <iframe
        src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3866.0028977128395!2d121.05988718569277!3d14.311264340829535!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3397d7765b6efe13%3A0x5c1f442463449957!2sBRGY.%20STO.%20TOMAS%20CITY%20HALL!5e0!3m2!1sen!2sph!4v1673092846980!5m2!1sen!2sph"
        width="100%" height="450" style="border:0;" allowfullscreen="" loading="lazy"
        referrerpolicy="no-referrer-when-downgrade"></iframe>
    </div>

    <div class="about-us" id="about">
      <div class="abt left">
        <h3>ABOUT US</h3>
        <p>Barangay Sto tomas is a barangay in the City of Biñan in Laguna. A population of almost 50,000 is residing in Barangay Sto Tomas.

        
          <br><br>
        </p>
        <h3>Mission and Vision</h3>
        <br>
        <h3>Mission</h3>
        <p>To have an environmental friendly livelihood programs that will help tighten the promotion of education, and 
          livelihood programs that will resolve the need of the people for the progressive and strong community
        </p>
        <h3>Vision</h3>
        <p>A prosperous barangay maintaining the beauty of nature, with extensive insight for the future of united 
          individuals and serving with fear of God, loving the motherland and with confidence in dealing with a global changes of life.
        </p>
   
          <br>
        </p>
        <h3>BARANGAY OFFICIALS</h3>
        <p>
        VANESA ZABALLA ZAPATA		  	Barangay Captain <br>	
        JESUS DEJAN ROMANTIGUE		  Barangay Kagawad <br>	
        ELIZABETH RECANA AQUINO	  	Barangay Kagawad	<br>	
        DIONISIO VISTA BASMAYOR JR.		  Barangay Kagawad	<br>	
        RESTITUTO DEL ROSARIO MANARIN		Barangay Kagawad	<br>	
        AMANDA MAGDARAOG DIMARANAN		Barangay Kagawad		 <br>	
        NEIL DE MESA BAUTISTA			Barangay Kagawad		 <br>	
        EDUARDO DIMARANAN SALAZAR		Barangay Kagawad<br>	
        KIMHEA NICOLE BERMEJO GUZMAN		SK Chairman	<br>	
        RODEL CUNACO GONZALES		Secretary	<br>	
        </p>
      </div>
      <div class="abt right">
        <h3>FB PAGE</h3>
        <iframe
          src="https://www.facebook.com/plugins/page.php?href=https%3A%2F%2Fweb.facebook.com%2Fbstbinanmain&tabs=timeline&width=340&height=500&small_header=false&adapt_container_width=true&hide_cover=false&show_facepile=true&appId"
          width="340" height="500" style="border:none;overflow:hidden" scrolling="no" frameborder="0"
          allowfullscreen="true"
          allow="autoplay; clipboard-write; encrypted-media; picture-in-picture; web-share"></iframe>
      </div>
    </div>


    <footer class="footer">
      <div class="column">
        <center><img src="img/logo.png"></center>
        <p>A Barangay that is God-centered, competent, orderly, 
          honest, peaceful, credible, gender responsive and abides
          the Code of Conduct.</p>
      </div>
      <div class="column2">
        <h3>GET IN TOUCH</h3>
        <p>For requests, information or comments, please contact below:</p>
        <ul class="box">
          <li>Tel. no.: 535-8032</li>
          <li>Biñan 911: 0917-120-8911</li>
          <li>Mail: bsmsstotomas@gmail.com</li>
        </ul>
    </div>
    </footer>

    <section class="overlay"></section>

    <script>
      const navBar = document.querySelector("nav"),
        menuBtns = document.querySelectorAll(".menu-icon"),
        overlay = document.querySelector(".overlay");

      menuBtns.forEach((menuBtn) => {
        menuBtn.addEventListener("click", () => {
          navBar.classList.toggle("open");
        });
      });

      overlay.addEventListener("click", () => {
        navBar.classList.remove("open");
      });
    </script>
  </body>
</html>