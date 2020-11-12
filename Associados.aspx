 <%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Associados.aspx.cs" Inherits="Web_Atletica.Associados" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Alunos Associados</title>
   
    <link rel="stylesheet" type="text/css" href="css/custom.css"/>	
	<link rel="stylesheet" href="assets/css/main.css" /> 
    <link href="pck/fontawesome/css/font-awesome.css" rel="stylesheet" />
	<script src="assets/js/jquery.min.js"></script>    
    <scr src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script> 
    <script src="js/bootstrap.min.js"></script>	
	<script type="text/javascript" src="js/jquery.mask.min.js"></script>
    <link href="css/bootstrap.css" rel="stylesheet" /> 
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

	<br />

<div id="divAlunos" runat="server" class="container">
	<!-- Aqui vem o filtro de busca -->
	<div class="row" style="margin-bottom: 10px">
               <div style="width:25%">
                       <div style="display:flex; flex-direction:row; align-items:center">
                           <asp:Label ID="lblFiltroNome" runat="server" CssClass="inputLabel" style="min-width:60px" AssociatedControlID="txtFiltroNome">Nome: <span style="color:red">*</span></asp:Label>
                           <asp:TextBox ID="txtFiltroNome" runat="server"></asp:TextBox>
                   </div>
                   </div>

               <div style="width:25%">
                       <div style="display:flex; flex-direction:row; align-items:center">
                           <asp:Label ID="lblFiltroRA" runat="server" CssClass="inputLabel" style="min-width:60px" AssociatedControlID="txtFiltroRA">RA: <span style="color:red">*</span></asp:Label>
                           <asp:TextBox ID="txtFiltroRA" runat="server"></asp:TextBox>
                   </div>
                   </div>
                    
                   <div style="width:25%">
                       <div style="display:flex; flex-direction:row; align-items:center">
                               <asp:Label ID="lblFiltroSituacao" runat="server" CssClass="inputLabel" style="min-width:80px" AssociatedControlID="cboFiltroSituacao">Situação: <span style="color:red">*</span></asp:Label>
                           <asp:DropDownList ID="cboFiltroSituacao" runat="server" CssClass="Text">
                               <asp:ListItem Value="Todos" Text="Todos"></asp:ListItem>
                               <asp:ListItem Value="Associado" Text="Associados"></asp:ListItem>
                               <asp:ListItem Value="Não Associado" Text="Não Associados"></asp:ListItem>
                           </asp:DropDownList>
                   </div>
               </div>
                
                   <div style="width:20px">
                       <asp:Button ID="btnFiltrar" runat="server" Text="Pesquisar" style="text-align:center" OnClick="btnFiltrar_Click"/>
                   </div>
               </div>
	
	<asp:GridView ID="GridAlunos" runat="server" AutoGenerateColumns="false" OnRowCommand="GridAlunos_RowCommand" style="border: 1px solid gray; font-size:small;">
		<AlternatingRowStyle BackColor="White" />
		<Columns>

			<asp:TemplateField>
                       <ItemTemplate>
                           <asp:LinkButton ID="lnkSelecionar" runat="server" CommandName="Selecionar"  CommandArgument='<%#Eval("id_aluno") %>'  >
                              <span class="fa fa-pencil"></span>
                           </asp:LinkButton>
                       </ItemTemplate>
                   </asp:TemplateField>

			<asp:BoundField HeaderText="Aluno" DataField="no_aluno" />
			<asp:BoundField HeaderText="RA" DataField="matri_aluno" />
			<asp:BoundField HeaderText="Campus" DataField="camp_aluno" />
			<asp:BoundField HeaderText="Curso" DataField="cur_aluno" />
			<asp:BoundField HeaderText="Turno" DataField="tur_aluno" />
			<asp:BoundField HeaderText="Esporte" DataField="esp_aluno" />
			<asp:BoundField HeaderText="Telefone" DataField="tel_aluno" />
			<asp:BoundField HeaderText="Situação" DataField="situ_aluno" />

			<asp:TemplateField>
                       <ItemTemplate>
                           <asp:LinkButton ID="lnkExcluir" runat="server" CommandName="Excluir"  CommandArgument='<%#Eval("id_aluno") %>'  OnClientClick="return Apagar()">
                               <span class="fa fa-trash" style="color:tomato"></span>
                           </asp:LinkButton>
                       </ItemTemplate>
                   </asp:TemplateField>
		</Columns>				
	</asp:GridView>
	<asp:Button ID="btnIncluir" runat="server" Text="Incluir Aluno" OnClick="btnIncluir_Click"  Class="btn btn-primary" style="margin-bottom:8px" />
	</div>

	<div id="DivCadastroAluno" runat="server" visible="false" class="col-12">
		<asp:HiddenField ID="id_alunoSelecionado" runat="server"/>
		<asp:HiddenField ID="matri_alunoSelecionado"  runat="server"/>

		<table style="width:500px;border:1px solid;margin-left:30px" class="table table-hover"  >
			<tr>
				<td >
					E-mail:
				</td>
				<td>
					<asp:TextBox ID="usuario" runat="server"></asp:TextBox>
				</td>
			</tr>
			<tr>
				<td>
					Senha:
				</td>
				<td>
					<asp:TextBox  TextMode="Password" ID="senha"  runat="server"></asp:TextBox>
				</td>
			</tr>
			<tr>
				<td>
					Aluno:
				</td>
				<td>
					<asp:TextBox ID="txtAluno" runat="server"></asp:TextBox>
				</td>
			</tr>			
			<tr>
				<td>
					R.A:
				</td>
				<td>
					<asp:TextBox ID="txtMatricula" runat="server"></asp:TextBox>
				</td>
			</tr>
			<tr>
				<td>
					Campus:
				</td>
				<td>
					<asp:DropDownList ID="cboCampus" runat="server">
						<asp:ListItem Value="-" Text="-"></asp:ListItem>
						<asp:ListItem Value="Asa Norte" Text="Asa Norte"></asp:ListItem>
						<asp:ListItem Value="Taguatinga" Text="Taguatinga"></asp:ListItem>
					</asp:DropDownList>
				</td>
			</tr>
			<tr>
				<td>
					Curso:
				</td>
				<td>
					<asp:DropDownList ID="cboCurso" runat="server">
						<asp:ListItem Value="-" Text="-"></asp:ListItem>
						<asp:ListItem Value="Análise e desenvolvimento de sistemas" Text="Análise e desenvolvimento de sistemas"></asp:ListItem>
						<asp:ListItem Value="Ciências da Computação" Text="Ciências da Computação"></asp:ListItem>
					</asp:DropDownList>
				</td>
			</tr>
			<tr>
				<td>
					Turno:
				</td>
				<td>
					<asp:DropDownList ID="cboTurno" runat="server">
						<asp:ListItem Value="-" Text="-"></asp:ListItem>
						<asp:ListItem Value="Matutino" Text="Matutino"></asp:ListItem>
						<asp:ListItem Value="Vespertino" Text="Vespertino"></asp:ListItem>
						<asp:ListItem Value="Noturno" Text="Noturno"></asp:ListItem>
					</asp:DropDownList>
				</td>
			</tr>
			<tr>
				<td>
					Esporte:
				</td>
				<td>
					<asp:TextBox ID="txtEsporte" runat="server"></asp:TextBox>
				</td>
			</tr>
			<tr>
				<td>
					Telefone:
				</td>
				<td>
					<asp:TextBox ID="txtTelefone" runat="server" placeholder="(XXX)XXXXX-XXXX"></asp:TextBox>
				</td>
			</tr>
			<tr>
				<td>
					Situação:
				</td>
				<td>
					<asp:DropDownList ID="cboSituacao" runat="server">
						<asp:ListItem Value="-" Text="-"></asp:ListItem>
						<asp:ListItem Value="Associado" Text="Associado"></asp:ListItem>
						<asp:ListItem Value="Não Associado" Text="Não Associado"></asp:ListItem>						
					</asp:DropDownList>
				</td>
			</tr>
			<td colspan="2">
				<asp:Button ID="btnSalvar" runat="server" Text="Salvar" OnClick="btnSalvar_Click" OnClientClick="return ValidarCampos();" />
				<asp:Button ID="btnCancelar" runat="server" Text="Cancelar" OnClick="btnCancelar_Click" OnClientClick="return Cancelar()" />
 			</td>
		</table>
	</div>
	<footer id="rodape">
     <p>	&#169;Copyright 2020 - by Ana Clara <br/>
    <a href="http://facebook.com/anaclarass" target="_blank">Facebook </a>| <a href="http://twitter.com/aninhaasoares_" target="_blank"> Twitter</a></p>
</footer>
	
	<script typeof="javascript">

        $(document).ready(function () {

			$("#txtTelefone").mask("(999) 99999-9999");
        });

		function ValidarCampos() {

			var id_aluno = $("#id_alunoSelecionado").val();           

			var txtAluno = $("#txtAluno").val();
			if (txtAluno == "") {
				alert("ALUNO obrigatório");
				$("#txtAluno").focus;
				return false;
			}

			var txtMatricula = $("#txtMatricula").val();
			if (txtMatricula == "") {
				alert("RA obrigatório");
				$("txtMatricula").focus;
				return false;
			}

            var txtCampus = $("#txtCampus").val();
            if (txtCampus == "") {
                alert("CAMPUS é obrigatório");
                $("txtCampus").focus;
                return false;
			}

            var txtCurso = $("#txtCurso").val();
            if (txtCurso == "") {
                alert("CURSO é obrigatório");
                $("txtCurso").focus;
                return false;
			}

            var txtTurno = $("#txtTurno").val();
            if (txtTurno == "") {
                alert("TURNO é obrigatório");
                $("txtTurno").focus;
                return false;
			}

            var txtSituacao = $("#txtSituacao").val();
            if (txtSituacao == "") {
                alert("Situação é obrigatório");
                $("txtSituacao").focus;
                return false;
			}

            var usuario = $("#usuario").val();
            if (usuario == "") {
                alert("Para atualização é obrigatório o E-MAIL preenchido.");
                $("usuario").focus;
                return false;
            }

			if (id_aluno == "") {
				var senha = $("#=senha").val();
				if (senha == "") {
					alert("Campo Senha é obrigatório");
					$("#senha").focus;
					return false;
				}

			}


			return true;
		}			            
		
		function Cancelar() {
			if (confirm("Deseja cancelar?")) {
				return true;
			} else {
				return false;
			}
		}

		function Apagar() {
			if (confirm("Tem certeza que deseja apagar?")) {
				return true;
			} else {
				return false;
            }
        }


	</script>
</form>
		
</body>
</html>
