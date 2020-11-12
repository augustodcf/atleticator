<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Produtos.aspx.cs" Inherits="Web_Atletica.Produtos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Produtos</title>

    <link rel="stylesheet" type="text/css" href="css/custom.css"/>
	<link rel="stylesheet" href="css/bootstrap.min.css"/>
	<link rel="stylesheet" href="assets/css/main.css" />
    <link href="pck/fontawesome/css/font-awesome.css" rel="stylesheet" />
    <script src="assets/js/jquery.min.js"></script>    
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"> </script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>
    <header>
	<nav id="menu"> 
		<h3>Associação Acadêmica Atlética Cybernética</h3>
	</nav>
		<ul class="icons">
     <li><span class="fa fa-user-circle">
      <asp:Label ID="lblNomeUsuario" runat="server"></asp:Label></span></li>
 </ul>

		<div class="topnav">	
	<a href="PaginaPrincipal.aspx">Home</a>
	<a href="Produtos.aspx">Produtos</a>
	<a href="Associados.aspx">Associados</a>
	<a href="Login.aspx">Sair</a>
    </div>
</header>
    <form id="form1" runat="server">
        <div>
        </div>
    </form>
</body>
</html>
