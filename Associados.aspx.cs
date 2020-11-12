using AcessoDadosDAO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web_Atletica
{
    public partial class Associados : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Identificador"] != null && Session["Identificador"].ToString() != "")
                lblNomeUsuario.Text = Session["NomeAluno"].ToString();
            else
                Response.Redirect("Login.aspx", true);

            Atualizacao();


        }


        public void Atualizacao()
        {
            DataTable dtAluno = new AlunoDAO().ListarAlunos();

            GridAlunos.DataSource = dtAluno;
            GridAlunos.DataBind();
        }

        public void AtualizacaoFiltro(DataTable ds)
        {
            GridAlunos.DataSource = ds;
            GridAlunos.DataBind();
        }

        public bool VerificarRA(string RA)
        {
            try
            {
                DataTable dtAluno = new AcessoDadosDAO.AlunoDAO().ConsultarRA(RA);

                if (dtAluno.Rows.Count > 0)
                {
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
        protected void btnSalvar_Click(object sender, EventArgs e)
        {

            string id_aluno = id_alunoSelecionado.Value;
            string matriculabd = matri_alunoSelecionado.Value;

            string Email = usuario.Text;
            string Senha = senha.Text;
            string Aluno = txtAluno.Text;
            string RA = txtMatricula.Text;
            string Campus = cboCampus.SelectedValue;
            string Curso = cboCurso.SelectedValue;
            string Turno = cboTurno.SelectedValue;
            string Esporte = txtEsporte.Text;
            string Telefone = txtTelefone.Text;
            string Situacao = cboSituacao.SelectedValue;

            AlunoDAO alunoDAO = new AlunoDAO();

            if (id_aluno == "")
            {
                if (VerificarRA(RA) == false)
                {
                    alunoDAO.InserirAluno(Email, Senha, Aluno, RA, Campus, Curso, Turno, Esporte, Telefone, Situacao);
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Dados inseridos com sucesso');", true);

                    Atualizacao();
                    divAlunos.Visible = true;
                    DivCadastroAluno.Visible = false;
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('RA já existente.');", true);
                }
            }
            else
            {
                if ((VerificarRA(RA) & RA == matriculabd))
                {
                    alunoDAO.AtualizarAluno(Convert.ToInt32(id_aluno), Email, Senha, Aluno, RA, Campus, Curso, Turno, Esporte, Telefone, Situacao);
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('RA já existente.');", true);
                }

                Atualizacao();

                divAlunos.Visible = true;
                DivCadastroAluno.Visible = false;
            }


        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            divAlunos.Visible = true;
            DivCadastroAluno.Visible = false;
        }

        protected void btnIncluir_Click(object sender, EventArgs e)
        {
            divAlunos.Visible = false;
            DivCadastroAluno.Visible = true;
        }

        protected void GridAlunos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Excluir")
            {
                string id_aluno = e.CommandArgument.ToString();
                AlunoDAO AlunoDAO = new AlunoDAO();
                AlunoDAO.DeletarAluno(Convert.ToInt32(id_aluno));

                Atualizacao();

            }

            if (e.CommandName == "Selecionar")
            {
                string id_aluno = e.CommandArgument.ToString();
                id_alunoSelecionado.Value = id_aluno;


                AlunoDAO AlunoDAO = new AlunoDAO();
                DataTable dtAluno = AlunoDAO.SelecionarAluno(Convert.ToInt32(id_aluno));


                if (dtAluno.Rows.Count > 0)
                {
                    string Email = dtAluno.Rows[0]["email_aluno"].ToString();
                    string Aluno = dtAluno.Rows[0]["no_aluno"].ToString();
                    string RA = dtAluno.Rows[0]["matri_aluno"].ToString();
                    string Campus = dtAluno.Rows[0]["camp_aluno"].ToString();
                    string Curso = dtAluno.Rows[0]["cur_aluno"].ToString();
                    string Turno = dtAluno.Rows[0]["tur_aluno"].ToString();
                    string Esporte = dtAluno.Rows[0]["esp_aluno"].ToString();
                    string Telefone = dtAluno.Rows[0]["tel_aluno"].ToString();
                    string Situacao = dtAluno.Rows[0]["situ_aluno"].ToString();

                    usuario.Text = Email;
                    txtAluno.Text = Aluno;
                    txtMatricula.Text = RA;
                    matri_alunoSelecionado.Value = RA;
                    cboCampus.SelectedValue = Campus;
                    cboCurso.SelectedValue = Curso;
                    cboTurno.SelectedValue = Turno;
                    txtEsporte.Text = Esporte;
                    txtTelefone.Text = Telefone;
                    cboSituacao.SelectedValue = Situacao;

                    divAlunos.Visible = false;
                    DivCadastroAluno.Visible = true;
                }
            }
        }

        protected void btnFiltrar_Click(object sender, EventArgs e)
        {
            AlunoDAO alunoDAO = new AlunoDAO();
            string[] Campos = { null, null, null };

            if (txtFiltroNome.Text != "")
                Campos[0] = txtFiltroNome.Text;

            if (txtFiltroRA.Text != "")
                Campos[1] = txtFiltroRA.Text;

            if (cboFiltroSituacao.SelectedValue != "Todos")
                Campos[2] = cboFiltroSituacao.SelectedValue;

            if (Campos[0] != null || Campos[1] != null || Campos[2] != null)
                AtualizacaoFiltro(ds: alunoDAO.FiltrarCampos(Campos));
            else
                Atualizacao();
        }
    }
}