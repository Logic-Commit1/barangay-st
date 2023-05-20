<?php
session_start();

if (isset($_SESSION["username"])) {
	header("Location: dashboard.php");
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
	<?php include "templates/header.php"; ?>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Barangay Sto. Tomas-Login</title>
    <link href="img/logo.png" rel="icon" type="image/x-icon">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <script src="https://kit.fontawesome.com/a81368914c.js"></script>


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
        box-shadow: 0 0 3px rgba(0, 0, 0, 0.1);
        z-index: 1;
    }

    a {
        text-decoration: none;
        color: #000000;
        margin: 15px 0px;
    }

    .logo-brgy {
        color: #000000;
        font-size: 22px;
        font-weight: 500;
        display: flex;
        align-items: center;
        margin: auto;
    }

    .container2{
        width: 100vw;
        display: grid;
        grid-template-columns: repeat(2, 1fr);
        grid-gap :7rem;
        padding: 0 2rem;
    }

    .container{
        width: 100vw;
        height: 100vh;
        display: grid;
        grid-template-columns: repeat(2, 1fr);
        grid-gap :7rem;
        padding: 0 2rem;
        margin-top: 10px;
    }

    .img{
        display: flex;
        justify-content: flex-end;
        align-items: center;
        z-index: 1;
    }

    .login-content{
        display: flex;
        justify-content: flex-start;
        align-items: center;
        text-align: center;
    }

    .img img{
        width: 500px;
    }

    form{
        width: 360px;
    }

    .login-content img{
        height: 100px;
    }

    .login-content h2{
        margin: 0px 0;
        color: #333;
        text-transform: uppercase;
        font-size: 2.9rem;
    }

    .login-content .input-div{
        position: relative;
        display: grid;
        grid-template-columns: 7% 93%;
        margin: 25px 0;
        padding: 5px 0;
        border-bottom: 2px solid #d9d9d9;
    }

    .login-content .input-div.one{
        margin-top: 0;
    }

    .i{
        color: #d9d9d9;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .i i{
        transition: .3s;
    }

    .input-div > div{
        position: relative;
        height: 45px;
    }

    .input-div > div > h5{
        position: absolute;
        left: 10px;
        top: 50%;
        transform: translateY(-50%);
        color: #B7B7B7;
        font-size: 18px;
        transition: .3s;
    }

    .input-div:before, .input-div:after{
        content: '';
        position: absolute;
        bottom: -2px;
        width: 0%;
        height: 2px;
        background-color: #0065A3;
        transition: .4s;
    }

    .input-div:before{
        right: 50%;
    }

    .input-div:after{
        left: 50%;
    }

    .input-div.focus:before, .input-div.focus:after{
        width: 50%;
    }

    .input-div.focus > div > h5{
        top: -5px;
        font-size: 15px;
    }

    .input-div.focus > .i > i{
        color: #0065A3;
    }

    .input-div > div > input{
        position: absolute;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        border: none;
        outline: none;
        background: none;
        padding: 0.5rem 0.7rem;
        font-size: 1.2rem;
        color: #555;
        font-family: 'poppins', sans-serif;
    }

    .input-div.pass{
        margin-bottom: 4px;
    }

    a{
        display: block;
        text-align: right;
        text-decoration: none;
        color: #B7B7B7;
        font-size: 0.9rem;
        transition: .3s;
    }

    a:hover{
        color: #203647;
    }

    .btn{
        display: block;
        width: 100%;
        height: 50px;
        border-radius: 5px;
        outline: none;
        border: none;
        background: #203647;
        background-size: 200%;
        font-size: 1.2rem;
        color: #fff;
        font-family: 'Poppins', sans-serif;
        text-transform: uppercase;
        margin: 1rem 0;
        cursor: pointer;
        transition: .5s;
    }

    .btn1{
        display: block;
        width: 100%;
        height: 50px;
        border-radius: 5px;
        outline: none;
        border: none;
        background: #0065A3;
        background-size: 200%;
        font-size: 1.2rem;
        color: #fff;
        font-family: 'Poppins', sans-serif;
        text-transform: uppercase;
        margin: 1rem 0;
        cursor: pointer;
        transition: .5s;
    }

    .btn .btn1:hover{
        background-position: right;
    }


    @media screen and (max-width: 1050px){
        .container{
            grid-gap: 5rem;
        }
    }

    @media screen and (max-width: 1000px){
        form{
            width: 290px;
        }

        .login-content h2{
            font-size: 2.4rem;
            margin: 8px 0;
        }

        .img img{
            width: 400px;
        }
    }

    @media screen and (max-width: 900px){
        .container{
            grid-template-columns: 1fr;
        }

        .img{
            display: none;
        }

        .wave{
            display: none;
        }

        .login-content{
            justify-content: center;
        }
    }                       


	</style>
</head>

<body>
	<?php include "templates/loading_screen.php"; ?>
	

			<?php include "templates/alert.php"; ?>
            <div class="container2">
        <nav>
            <div class="logo-brgy">
                <span href="#">BARANGAY STO. TOMAS</span>
            </div>
        </nav>
    </div>
    <div class="container">
        <div class="img">
            <img src="barangay-sto-tomas/assests/img/bgg.png">
        </div>
        <div class="login-content">
            <form method="POST" action="model/login.php" autocomplete="off">
                <img src="img/logo.png">
                <h2 class="title">Welcome</h2>

                <div class="input-div one">
                    <div class="i">
                        <i class="fas fa-user"></i>
                    </div>
               
                    <div class="div">
								<input id="username" name="username" type="text" class="input" required>
								<h5>Username</h5>
						</div>
					</div>

                    <div class="input-div pass">
                    <div class="i">
                        <i class="fas fa-lock"></i>
                    </div>
                            <div class="div">
								<input id="password" name="password" type="password" class="input" required>
								<h5>Password</h5>
								
							</div>
					</div>
                    <a href="#">Forgot Password?</a>
                <input type="submit" class="btn" value="Login">
              
                </form>
                            
				</form>
			</div>
	
	</div>
    <script type="text/javascript" src="js/main.js"></script>
	<?php include "templates/footer.php"; ?>
</body>
    <script>
        const inputs = document.querySelectorAll(".input");


        function addcl(){
            let parent = this.parentNode.parentNode;
            parent.classList.add("focus");
        }

        function remcl(){
            let parent = this.parentNode.parentNode;
            if(this.value == ""){
                parent.classList.remove("focus");
            }
        }


        inputs.forEach(input => {
            input.addEventListener("focus", addcl);
            input.addEventListener("blur", remcl);
        });
    </script>
</html>