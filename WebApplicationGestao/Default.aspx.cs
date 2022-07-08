using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using WebApplicationGestao.ServiceReference1;

namespace WebApplicationGestao
{
    public partial class _Default : Page
    {
        ServiceReference1.Service1Client obj = new ServiceReference1.Service1Client();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BindRegRecordsInGrid();
            }
        }
        private void BindRegRecordsInGrid()
        {
            DataSet ds = new DataSet();
            ds = obj.GetUserRegDetails();
            grdCliente.DataSource = ds;
            grdCliente.DataBind();
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (btnCriar.Text == "Update")
            {
                Update();
            }
            else
            {
                SaveRegDetails();
            }
        }

        private void Update()
        {
            RegDetails regDet = new RegDetails();
            regDet.CPF = txtCPF.Text.Trim();
            regDet.Nome = txtNome.Text.Trim();
            regDet.Tipo = txtTipo.Text.Trim();
            regDet.Sexo = txtSexo.Text.Trim();
            regDet.Situacao = txtSituacao.Text.Trim();

            obj.UpdateUserRegDetails(regDet);
            lblStatus.Text = obj.UpdateUserRegDetails(regDet);
            ClearControls();
            BindRegRecordsInGrid();
        }

        private void ClearControls()
        {
            txtCPF.Text = string.Empty;
            txtNome.Text = string.Empty;
            txtTipo.Text = string.Empty;
            txtSexo.Text = string.Empty;
            txtSituacao.Text = string.Empty;

            txtCPF.Focus();
        }

        private void SaveRegDetails()
        {
            RegDetails regDet = new RegDetails();
            regDet.CPF = txtCPF.Text.Trim();
            regDet.Nome = txtNome.Text.Trim();
            regDet.Tipo = txtTipo.Text.Trim();
            regDet.Sexo = txtSexo.Text.Trim();
            regDet.Situacao = txtSituacao.Text.Trim();
            lblStatus.Text = obj.InsertUserRegDetails(regDet);
            ClearControls();
            BindRegRecordsInGrid();
        }

        protected void imgEdit_Command(object sender, System.Web.UI.WebControls.CommandEventArgs e)
        {
            RegDetails regDet = new RegDetails();
            regDet.CPF = e.CommandArgument.ToString();
            ViewState["cpf"] = regDet.CPF;
            DataSet ds = new DataSet();
            ds = obj.FetchUpdatedRecords(regDet);

            if (ds.Tables[0].Rows.Count > 0)
            {
                txtNome.Text = ds.Tables[0].Rows[0]["nome"].ToString();
                txtTipo.Text = ds.Tables[0].Rows[0]["tipoCliente"].ToString();
                txtSexo.Text = ds.Tables[0].Rows[0]["sexo"].ToString();
                txtSituacao.Text = ds.Tables[0].Rows[0]["situacaoCliente"].ToString();

                btnCriar.Text = "Update";
            }
        }

        protected void imgDel_Command(object sender, System.Web.UI.WebControls.CommandEventArgs e)
        {
            RegDetails regDet = new RegDetails();
            regDet.CPF = e.CommandArgument.ToString();
            if (obj.DeleteUserRegDetails(regDet) == true)
            {
                lblStatus.Text = "Deletado";
            }
            else
            {
                lblStatus.Text = "Não foi deletado";
            }
            BindRegRecordsInGrid();
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            ClearControls();
            lblStatus.Text = string.Empty;
        }
    }
    }