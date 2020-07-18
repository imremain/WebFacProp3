using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebFacturacion3.BussinessObjectsLayer;
using WebFacturacion3.DataAccessLayer;

namespace WebFacturacion3.View
{
    public partial class formCliente : System.Web.UI.Page
    {
        #region Methods

        void Insertar()
        {
            try
            {
                int agregar = 0;
                Cliente cte = new Cliente();

                cte.Nombre = txtNombre.Text;
                cte.Direccion = txtDomicilio.Text;
                cte.Telefono = txtTelefono.Text;
                cte.Email = txtCorreo.Text;
                cte.Rfc = txtRFC.Text;
                cte.FechaNacimiento = Convert.ToDateTime(txtBox.Text);

                agregar = ClienteDA.InsertarCliente(cte);

                if (agregar > 0)
                {
                    Response.Write("<script> alert(\" El cliente " + cte.Nombre + "ha sido creado exitosamente con el id: " + cte.id_Cliente + " \"); </script>");
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        /*
        List<Cliente> RellenarClientes()
        {
            
        }
        */
        #endregion

        #region Events
        protected void Page_Load(object sender, EventArgs e)
        {
            Selecciona();   
        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            Insertar();
        }

        void Selecciona()
        {
            Int32? idCliente = null;
            String nombre = String.Empty;
            String rfc = String.Empty;

            GridViewClientes.DataSource = ClienteDA.SeleccionaClientes(idCliente, nombre, rfc);
            GridViewClientes.DataBind();
        }

        void Eliminar(int filaActual)
        {
            int id_Cliente = (int)this.GridViewClientes.DataKeys[filaActual]["id_Cliente"];

            ClienteDA.EliminaCliente(id_Cliente);
        }

        void rellenarForm(int filaActual) 
        {
            int id_Cliente;
            string Nombre, Direccion, Telefono, Email, RFC;
            DateTime FechaNac;

            DataKey dk = GridViewClientes.DataKeys[filaActual];

            int cliente = Convert.ToInt32(dk["id_Cliente"]);

            id_Cliente = (int)this.GridViewClientes.DataKeys[filaActual]["id_Cliente"];
            Nombre    = (string)this.GridViewClientes.DataKeys[filaActual]["Nombre"];
            Direccion = (string)this.GridViewClientes.DataKeys[filaActual]["Direccion"];
            Telefono  = (string)this.GridViewClientes.DataKeys[filaActual]["Telefono"];
            Email     = (string)this.GridViewClientes.DataKeys[filaActual]["Email"];
            RFC       = (string)this.GridViewClientes.DataKeys[filaActual]["Rfc"];
            FechaNac  = (DateTime)this.GridViewClientes.DataKeys[filaActual]["FechaNacimiento"];


            txtIdCliente.ReadOnly = true;
            txtIdCliente.Text     = id_Cliente.ToString();
            txtNombre.Text        = Nombre;
            txtDomicilio.Text     = Direccion;
            txtTelefono.Text      = Telefono;
            txtCorreo.Text        = Email;
            txtRFC.Text           = RFC;
            CalendarExtender1.SelectedDate = FechaNac;

            btnIngresar.Enabled = false;
        }

        void actualizar()
        {           
            try {
                int agregar = 0;

                
                Cliente cte    = new Cliente();

                cte.id_Cliente      = Convert.ToInt32(txtIdCliente.Text);
                cte.Nombre          = txtNombre.Text;
                cte.Direccion       = txtDomicilio.Text;
                cte.Telefono        = txtTelefono.Text;
                cte.Email           = txtCorreo.Text;
                cte.Rfc             = txtRFC.Text;
                cte.FechaNacimiento = Convert.ToDateTime(CalendarExtender1.SelectedDate.ToString());

                agregar = ClienteDA.ActualizaCliente(cte);

                if (agregar > 0) {
                    LimiarCajas(Page);
                    Selecciona();
                    
                    Response.Write("se a agregado el cliente exitosamente");
                }
            } catch(Exception ex) {
                throw ex;
            }

            
        }


        #endregion

        protected void ItemClick(object sender, GridViewCommandEventArgs e) 
        {
            string botonSeleccionado = e.CommandName.ToString();
            int filaActual = Convert.ToInt32(e.CommandArgument.ToString());

            switch (botonSeleccionado)
            {
                case "Eliminar":
                    Eliminar(filaActual);
                    break;
                case "Actualizar":
                    rellenarForm(filaActual);
                    break;
                default :
                    Console.WriteLine("commando no permitido");
                    break;
            }
        }

        protected void GridViewClientes_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {

        }

        protected void Actualizar_Click(object sender, EventArgs e)
        {
            
            actualizar();
        }

        protected void LimiarCajas(Control p1)
        {
            foreach (Control ctrl in p1.Controls)
            {
                if (ctrl is TextBox)
                {
                    TextBox t = ctrl as TextBox;

                    if (t != null)
                    {
                        t.Text = String.Empty;
                    }
                }
                else
                {
                    if (ctrl.Controls.Count > 0)
                    {
                        LimiarCajas(ctrl);
                    }
                }
            }
        }

        protected void btnLimpiar_Click(object sender, EventArgs e)
        {
            LimiarCajas(Page);
        }

        protected void GridViewClientes_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridViewClientes.PageIndex = e.NewPageIndex;
            Selecciona();

        }
    }
}