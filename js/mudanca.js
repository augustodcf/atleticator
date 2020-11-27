function Login(){
	
var done=0;
var username=document.getElementById('usuario').value;
username=username.toLowerCase();
var password=document.getElementById('senha').value;
password=password.toLowerCase();
	if (username == "ana" && password == "clara") { window.open('http://www.google.com.br'); }
	if (done == 0) {
		alert("Senha ou Usuário inválido.");
		
}