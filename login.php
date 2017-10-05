<?php

	
// RECEBENDO OS DADOS PREENCHIDOS DO FORMULÁRIO !
	$email= $_POST ["txt_email"];//atribuição do campo "email" vindo do formulário para variavel
	$senha= $_POST ["txt_senha_logar"];//atribuição do campo "senha" vindo do formulário para variavel
	
	//Gravando no banco de dados ! conectando com o localhost - mysql
	$conexao = mysqli_connect("localhost","root","root","risadinha"); //localhost é onde esta o banco de dados.
	if (!$conexao)
	    die ("Erro de conexão com localhost, o seguinte erro ocorreu -> ".mysqli_connect_error()); 
 
	//conectando com a tabela do banco de dados
    $query = "SELECT apelido from users where email=\"$email\" and senha=\"$senha\"";
    if ($result = mysqli_query($conexao,$query)) {
        $row = $result->fetch_row();
        if ($row[0] == null || $row[0] == "") {
            
    	    
    	    echo "<br>login/senha invalidos";
    	    
					
        } else {
            header("Location: pag_estamos_trabalhando.html"); 
            
        }
    } else {
        echo "bug ao consultar o BD.";  
			
    }
    $result->close();
    mysqli_close($conexao);
	
?>
