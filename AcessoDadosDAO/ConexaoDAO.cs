using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AcessoDadosDAO
{
    public class ConexaoDAO
    {
        private string strConexao = "Server=localhost;Port=3307;Database=db_atletica;Uid=user_app;Pwd=20072019";

        public ConexaoDAO()
        {

        }

        public DataTable ExecuteQuery(string Query)
        {
            using (MySql.Data.MySqlClient.MySqlConnection conn = new MySqlConnection(strConexao))
            {
                conn.Open();

                string query = Query;

                DataTable dtResultado = new DataTable();
                MySqlCommand cmd = new MySqlCommand(query, conn);
                MySqlDataAdapter mySqlDataAdapter = new MySqlDataAdapter(cmd);
                mySqlDataAdapter.Fill(dtResultado);

                conn.Close();
                return dtResultado;
            }
        }

        public bool ExecuteNonQuery(string Comando)
        {

            try
            {//estabelecer uma conexão de acordo com a 
                using (MySql.Data.MySqlClient.MySqlConnection conn = new MySqlConnection(strConexao))
                {
                    conn.Open();

                    MySqlCommand cmd = new MySqlCommand(Comando, conn);
                    cmd.ExecuteNonQuery();

                    conn.Close();
                    return true;
                }
            }

            catch
            {
                return false;
            }

        }
    }
}
