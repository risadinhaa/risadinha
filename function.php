<?php 
	session_start();
	
	function seguranca() {
		if($_SESSION['nome']['apelido'] == null) {
			header("Location: home.html");
		}
	}
