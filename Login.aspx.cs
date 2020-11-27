using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web_Atletica
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private bool ValidarAluno(string Email, string Senha)
        {
            try
            {
                DataTable dtAluno = new AcessoDadosDAO.AlunoDAO().ValidarAluno(Email, Senha);

                if (dtAluno.Rows.Count > 0)
                {
                    Session.Add("Email", dtAluno.Rows[0]["email_aluno"].ToString());
                    Session.Add("Senha", dtAluno.Rows[0]["pwd_aluno"].ToString());
                    Session.Add("NomeAluno", dtAluno.Rows[0]["no_aluno"].ToString());
                    Session.Add("Identificador", dtAluno.Rows[0]["id_aluno"].ToString());
                    Response.Redirect("PaginaPrincipal.aspx", true);
                    return true;
                }

                else
                {
                    return false;
                }

            }

            catch (Exception ex)
            {
                throw ex;
            }

        }


        protected void btnAcessar_Click(object sender, EventArgs e)
        {
            try
            {
                string Email = usuario.Text;
                string Senha = senha.Text;

                if (Email != "" && Senha != "")
                {

                    bool retornoConexao = ValidarAluno(Email, Senha);

                    if (retornoConexao == true)
                    {
                        lblRetorno.Text = "Cliente Validado com Sucesso";
                        
                    }
                    else
                    {
                        lblRetorno.Text = "<div  class='alert alert-warning' role='alert'> Cliente ou senha Inválidos </div>";
                    }
                }
                else
                {
                    if (Email == "")
                        lblRetorno.Text = "<div  class='alert alert-warning' role='alert'> Login não preenchido </div>";
                    else
                        lblRetorno.Text = "<div  class='alert alert-warning' role='alert'> Senha não preenchida </div>";
                }
            }
            catch
            {
                lblRetorno.Text = "<div  class='alert alert-warning' role='alert'> Erro de conexão com o banco de dados </div>";
            }
        }
    }
}