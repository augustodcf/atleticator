﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Web_Atletica.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Login</title>

    <link rel="stylesheet" type="text/css" href="css/custom.css"/>
	<link rel="stylesheet" href="css/bootstrap.min.css"/>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"> </script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>
    <header>
	<nav id="menu"> 
		<h3>Associação Acadêmica Atlética Cybernética</h3>
	</nav>
</header>
    <form id="form1" runat="server">

        <div class="container">
       
           <asp:TextBox  type="hidden" ID="anchor" runat="server">
           </asp:TextBox>
           <asp:TextBox ID="logintoken" type="hidden" runat="server">
           </asp:TextBox>

      <div>
		    <figure>            
		    <img src="img/logoCybernética3.png" id="foto-principal"/>
		    </figure>
    </div>
          
           <p>&nbsp;</p>
            <p>&nbsp;</p>
            <p>&nbsp;</p>
            <p>&nbsp;</p>
        <div class="row col-sm-4 col-xs-12 mx-auto form-group">	    
                <asp:TextBox TextMode="Email" ID="usuario" runat="server" placeholder="Email" class="form-control"/>
                </div>            
    
               <div class="row col-sm-4 col-xs-12 mx-auto form-group">	    
			    <asp:TextBox TextMode="Password" ID="senha" runat="server" placeholder="******" class="form-control" />                  
               </div>

            <div class="row form-group col-sm-4 col-xs-12 mx-auto">
                <label>
                <asp:CheckBox ID="CheckBox1" runat="server"/>
                Manter Conectado Página
            </label>
            </div>

            <div class="row col-sm-4 col-xs-12 mx-auto form-group col-xs-12"> 
                <asp:Button  runat="server"  class="btn btn-primary"  Text="Acessar" id="btnAcessar"  OnClick="btnAcessar_Click" />
            </div>
            
            <h1><asp:Label ID="lblRetorno" runat="server"></asp:Label></h1>
      
    </div>
    </form>
</body>
</html>
