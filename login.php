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

	<title>Login - Barangay Services Management System</title>

	<style>
		url("https://fonts.googleapis.com/css2?family=Poppins:wght@400&display=swap");
        @import url("https://fonts.googleapis.com/css2?family=Poppins:wght@700&display=swap");
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: "Poppins", "sans-serif";
        }

        a {
            text-decoration: none;
        }
        [type="date"] {
            background: url(https://cdn1.iconfinder.com/data/icons/cc_mono_icon_set/blacks/16x16/calendar_2.png) 97% 50% no-repeat;
            border-color: none;
            width: 100%;
        }
            

            [type="date"]::-webkit-inner-spin-button {
                display: none;
            }

            [type="date"]::-webkit-calendar-picker-indicator {
                opacity: 0;
            }
        body {
            position: relative;
            background: #EEFBFB;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }
        nav {
            display: inline-flex;
            position:relative;
        }

        nav .title {
            text-align: center;
            margin-top: 10px;
            margin-left: 550px;
            margin-bottom: 10px;
            font-size:15px;
            font-weight:400;
        }

        nav .link {
            font-size: 17px;
            text-align: right;
            margin-left: 500px;
            margin-top: 10px;
            margin-bottom: 10px;
            font-weight: 700;
            
        }

            nav .link a {
                color: #000000;
                text-decoration: none;
                transition: 0.5s ease;
            }

                nav .link a:hover {
                    text-decoration:underline;
                }



        ::selection {
            color: #ececec;
            background: #00b3ff;
            
        }

        .form {
            position: absolute;
            margin-top: 50px;
            margin-right: 400px;
            margin-left: 400px;
            background: #EEE2DC;
            width: 50%;
            max-width: 500px;
            border-radius: 5px;
            box-shadow: -3px 3px 10px -5px rgba(0,0,0,0.2);
            padding: 30px 30px;
        }

        .form h2 {
                font-size: 30px;
                font-weight: 700;
                text-align: left;
                color: #000000;
            }
        .form h3 {
            font-size: 30px;
            font-weight: 700;
            text-align: center;
            color: #000000;
        }

            .form form {
                margin: 8px 0;
            }

            .form .grid-details {
                display: flex;
                
            }

                .form .grid-details .input:first-child {
                    
                    margin-right: 8px;
                    width: 100%;
                    text-align: center;
                    color: #001b48;
                    padding-block-start: 10px;
                }
            .form  .email {
            
                margin-right: 8px;
                width: 100%;
                color: #001b48;
                padding-block-start: 10px;
            }
            .form  .number {
            
                margin-right: 8px;
                width: 100%;
                color: #001b48;
                padding-block-start: 10px;
            }

                .form .grid-details .input:last-child {
                    margin-left: 8px;
                    width: 100%;
                    text-align: center;
                    color: #001b48;
                    padding-block-start: 10px;
                }
            .form .label:first-child {
                padding-block-start: 15px;
                margin-bottom: 8px;
            }
            .form .gender {
                list-style: none;
                display: inline;
                padding-block-start: 15px;
                font-size: 14px;
                width: 100%;
                margin-left: 20px;
                word-spacing: 35px;
                border-radius: 5px;
                box-shadow: -3px 3px 10px -5px rgba(0,0,0,0.2);
                padding: 4px 8px;
                border: 1px solid #000000;
                color: #808080;
                height:40px;
                outline:none;
            }

            .form .label:last-child {
                padding-block-start: 15px;
                margin-bottom:15px;
            }
            .form .date {
                border: 1px solid #c4c4c4;
                border-radius: 5px;
                background-color: #fff;
                padding: 3px 5px;
                box-shadow: inset 0 3px 6px rgba(0,0,0,0.1);
                width: 200px;
                margin-left: 20px;
                word-spacing: 10px;
                text-align:center;
            }
            .form .divide {
                margin-top: -20px;
            }  
            

            .form form .input input {
                height: 40px;
                width: 100%;
                font-size: 14px;
                padding: 0 8px;
                border: 1px solid #ccc;
                border-radius: 5px;
                outline: none;
            }

                .form form .input input:focus,
                .form form .input input:valid {
                    border: 2px solid #00b3ff;
                    transition: 0.1s ease;
                    outline: none;
                }
        
        

                
            .form form input.button {
                height: 45px;
                border: none;
                color: #EEFBFB;
                width: 100%;
                background: #12232E;
                font-size: 30px;
                border-radius: 5px;
                cursor: pointer;
                margin-top: 13px;
                transition: 0.5s ease;
                position: center;
                text-align: center;
                font-weight:700;
            }
						label.placeholder {
							background: transparent;
							cursor: auto;
						}
					
					.form .enter {
							position:center;
							margin-right: 8px;
							width: 100%;
							color: #001b48;
							text-align: center;
							margin-bottom: 25px;
							padding-block-start: 10px;
					}
					.form .pass {
							position: center;
							margin-right: 8px;
							width: 100%;
							text-align: center;
							color: #001b48;
							margin-bottom: 25px;
							padding-block-start: 10px;
					}
					.form .divider{
						background: #000000;
						height: 1px;
						margin-top: 25px;
												
					}
					.form .link {
							margin-top: 25px;
							text-align: center;
							width: 100%;
							height: 45px;
							border: none;
							background: #0065a3;
							font-size: 17px;
							border-radius: 5px;
							cursor: pointer;
							transition: 0.5s ease;
							text-align: center;
							font-weight: 700;
					}

							.form .link a {
									color: #ffffff;
									font-size: 30px;
									
							}  
						
					


	</style>
</head>

<body class="login">
	<?php include "templates/loading_screen.php"; ?>
	<div class="wrapper wrapper-login">

		<div class="container container-login animated fadeIn">

			<?php include "templates/alert.php"; ?>

			<h3 class="text-center">Login</h3>
			<div class="login-form">
				<form method="POST" action="model/login.php" autocomplete="off">
						<div class="enter">
							<div class="input">
			
								<input id="username" name="username" type="text" class="form-control input-border-bottom" required>
								<label for="username" class="placeholder">Username</label>
									
						</div>
					</div>
					<div class="pass">
							<div class="input">
								<input id="password" name="password" type="password" class="form-control input-border-bottom" required>
								<label for="password" class="placeholder">Password</label>
								<span toggle="#password" class="fa fa-fw fa-eye field-icon toggle-password"></span>
							</div>
					</div>
					<div class="form-action mb-3 d-flex flex-column gap-2">
						<button type="submit" class="btn btn-primary btn-block fw-bold">Sign In</button>

						<a href="resident-register.php" class="btn btn-success btn-block text-white fw-bold">Create New Account</a>
					</div>
				</form>
			</div>
		</div>
	</div>

	<?php include "templates/footer.php"; ?>
</body>

</html>