<?php

	
// RECEBENDO OS DADOS PREENCHIDOS DO FORMULÁRIO !
	$nome= $_POST ["txt_nome_cadastrar"];//atribuição do campo "nome" vindo do formulário para variavel
	$email= $_POST ["txt_email_cadastrar"];//atribuição do campo "email" vindo do formulário para variavel
	$senha= $_POST ["txt_senha_cadastrar"];//atribuição do campo "senha" vindo do formulário para variavel
	$data_de_nascimento= $_POST ["txt_data_nascimento_cadastrar"];//atribuição do campo "nome" vindo do formulário para variavel
	$apelido= $_POST ["txt_apelido_cadastrar"];//atribuição do campo "email" vindo do formulário para variavel

	//Gravando no banco de dados ! conectando com o localhost - mysql
	$conexao = mysqli_connect("localhost","root","root","risadinha"); //localhost é onde esta o banco de dados.
	if (!$conexao)
	    die ("Erro de conexão com localhost, o seguinte erro ocorreu -> ".mysqli_connect_error()); 
 
	//conectando com a tabela do banco de dados
    $query = "SELECT email from users where email=\"$email\"";
    if ($result = mysqli_query($conexao,$query)) {
        $row = $result->fetch_row();
        if ($row[0] == null || $row[0] == "") {
            
    	    $query = "INSERT INTO users (nome, email, senha, apelido, data_de_nascimento) VALUES (\"$nome\", \"$email\", \"$senha\", \"$apelido\", STR_TO_DATE(\"$data_de_nascimento\", \"%d/%m/%Y\"))";
    	    echo $query, "<br>";
    	    if($result = mysqli_query($conexao,$query))
    	        header("Location: estamos_trabalhando.html"); 
					           
			else
                echo "erro."; 
					
        } else {
            header("Location: cadastrar_erro.html");

        }
    } else {
        echo "bug ao consultar o BD.";  
			
    }
    $result->close();
    mysqli_close($conexao);
	
?>
