<?php
//Abrindo conrxão com o banco e guardando em uma variavel chamada BD
$BD = mysqli_connect("localhost", "root", "", "BD2Final");
?>

<!doctype html>
<html lang="pt-br">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
  <link rel="stylesheet" href="style.css">
  <title>Hello, world!</title>
</head>

<body>
  <div class="container">
    <div class="btn-group text-center w-100 my-2" role="group" aria-label="Basic example">
      <a href="?acao=inserir" class="btn btn-secondary">Inserir</a>
      <a href="?acao=consultar" class="btn btn-secondary">Consultar</a>
      <a href="?acao=listadedisciplina" class="btn btn-secondary">Lista de disciplina</a>
    </div>

    <?php
    if ($_REQUEST['acao'] == 'consultar') {
      echo "<ul class='list-group'>";

      //fazendo consulta SQL e guardando em uma variavel, para usar manipulando em outro momento.
      $consulta = $BD->query("Select * from Aluno");
      while ($aluno = mysqli_fetch_array($consulta)) {
        $id = $aluno['NumAluno'];
        echo "<li class='list-group-item'> <p>";
        echo $aluno['Nome'];
        echo "</p> <a href='?acao=excluir&id=$id' class='btn btn-danger btn-sm'>excluir</a> </li> ";
      }

      echo "</ul>";
    } else if ($_REQUEST['acao'] == 'inserir') {
      //Verificando se o formulário foi submetido
      if ($_SERVER['REQUEST_METHOD'] == 'POST') {
        $id = $_POST['id'];
        $nome = $_POST['nome'];
        $endereco = $_POST['id'];
        $cidade = $_POST['cidade'];
        $tel = $_POST['tel'];

        $insert = $BD->query("insert into Aluno values ($id, '$nome', '$endereco', '$cidade', '$tel', 2143)");

        if ($insert) echo "<h3>Beleza!</h3>";
        else echo $BD->error;
      } else
        //Se não for submissão de dados, mostra o formulário de cadastro
        echo "<form method='post'>
      <div class='form-group'>
        <input type='text' class='form-control' name='id' placeholder='Código aluno'>
      </div>
      <div class='form-group'>
        <input type='text' class='form-control' name='nome' placeholder='Nome'>
      </div>
      <div class='form-group'>
        <input type='text' class='form-control' name='endereco' placeholder='Endereço'>
      </div>
      <div class='form-group'>
        <input type='text' class='form-control' name='cidade' placeholder='Cidade'>
      </div>
      <div class='form-group'>
        <input type='text' class='form-control' name='tel' placeholder='Telefone'>
      </div>
      <button type='submit' class='btn btn-primary mb-2'>Cadastrar</button>
      </form>";
    } else if ($_REQUEST['acao'] == 'excluir') {
      $id = $_REQUEST['id'];
      $excluir = $BD->query("delete from Aluno where NumAluno=$id");
      if ($excluir) echo "<h3>Beleza!</h3>";
      else echo $BD->error;
    }

    ?>
  </div>

  <!-- Optional JavaScript; choose one of the two! -->

  <!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>

  <!-- Option 2: jQuery, Popper.js, and Bootstrap JS
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>
    -->
</body>

</html>