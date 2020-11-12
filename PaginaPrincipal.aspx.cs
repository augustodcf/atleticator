using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web_Atletica
{
    public partial class PaginaPrincipal : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["Identificador"] != null && Session["Identificador"].ToString() != "")
                lblNomeUsuario.Text = Session["NomeAluno"].ToString();
            else
                Response.Redirect("Login.aspx", true);

        }
    }
}