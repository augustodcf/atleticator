using System;
using System.Collections.Generic;
using System.ComponentModel.Design;
using System.Data;
using System.Globalization;
using System.Text;

namespace AcessoDadosDAO
{
    public class AlunoDAO : ConexaoDAO
    {
        public AlunoDAO()
        {

        }

        public DataTable ValidarAluno(string Email, string Senha)
        {
            string query = "Select * from tbl_aluno where email_aluno = '" + Email + "' and pwd_aluno = '" + Senha + "'";
            return ExecuteQuery(query);
        }

        public DataTable ConsultarRA(string RA)
        {
            string query = "Select matri_aluno from tbl_aluno where matri_aluno = '" + RA + "'";
            return ExecuteQuery(query);
        }

        public DataTable SelecionarAluno(int Id)
        {
            string query = "Select * from tbl_aluno where id_aluno = '" + Id + "'";
            return ExecuteQuery(query);
        }

        public DataTable FiltrarCampos(string[] Campos)
        {
            int count = 0;
            bool temNull = true;

            string query = "select * from tbl_aluno where ";

            foreach (string Campo in Campos)
            {
                if (Campo != null)
                {
                    if (temNull == false && count != 0)
                        query += " and ";

                    temNull = false;

                    switch (count)
                    {
                        case 0:
                            query += " no_aluno like '%" + Campo + "%'";
                            break;

                        case 1:
                            query += " matri_aluno like '%" + Campo + "%'";
                            break;

                        case 2:
                            query += " situ_aluno = '" + Campo + "'";
                            break;
                    }

                }
                count++;
            }
            query += ";";
            return ExecuteQuery(query);
        }

        public DataTable ListarAlunos()
        {
            string query = "Select * from tbl_aluno";
            return ExecuteQuery(query);
        }              

        public bool InserirAluno(string Email, string Senha, string Aluno, string RA, string Campus, string Curso, string Turno, string Esporte, string Telefone, string Situacao)
        {
            string query = "insert into tbl_aluno(email_aluno, pwd_aluno, no_aluno, matri_aluno, camp_aluno, cur_aluno, tur_aluno, esp_aluno, tel_aluno, situ_aluno)" + "values('" + Email + "', '" + Senha + "', '" + Aluno + "', '" + RA + "', '" + Campus + "', '" + Curso + "', '" + Turno + "', '" + Esporte + "', '" + Telefone + "', '" + Situacao + "')";
            return ExecuteNonQuery(query);
        }

        public bool AtualizarAluno(int Id, string Email, string Senha, string Aluno, string RA, string Campus, string Curso, string Turno, string Esporte, string Telefone, string Situacao)
        {
            string query = "update tbl_aluno set email_aluno = '" + Email + "'," +
                "no_aluno = '" + Aluno + "'," +
                "matri_aluno = '" + RA + "'," +
                "camp_aluno = '" + Campus + "'," +
                "cur_aluno = '" + Curso + "'," +
                "tur_aluno = '" + Turno + "'," +
                "esp_aluno = '" + Esporte + "'," +
                "tel_aluno = '" + Telefone + "'," +
                "situ_aluno = '" + Situacao + "'";

            if (Senha != "")
                query = query + " , pwd_aluno = '" + Senha + "'";

            query = query + "where id_aluno = " + Id;

            return ExecuteNonQuery(query);
        }

        public bool DeletarAluno(int Id)
        {
            string query = "delete from tbl_aluno where id_aluno = '" + Id + "'";
            return ExecuteNonQuery(query);
        }
    }
}
