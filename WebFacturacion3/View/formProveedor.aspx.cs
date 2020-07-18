using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebFacturacion3.DataAccessLayer;
using WebFacturacion3.BussinessObjectsLayer;
using System.Text.RegularExpressions;

namespace WebFacturacion3.View
{
    public partial class formProveedor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            Actualizar.Visible = false;
            if (!IsPostBack) {
                SeleccionaProveedores();
                LlenaDropDownListCiudades();
            }            
        }

        void LlenaDropDownListCiudades() {
            DropDownCiudad.DataSource = CiudadDA.SeleccionaCiudades();
            DropDownCiudad.DataTextField = "Nombre";
            DropDownCiudad.DataValueField = "id_Ciudad";
            DropDownCiudad.DataBind();        
        }

        void SeleccionaProveedores()
        {
            Int32? idProveedor = null;
            String nombre = String.Empty;

            GridViewProveedor.DataSource = ProveedorDA.SeleccionaProveedor(idProveedor, nombre);
            GridViewProveedor.DataBind();
        }

        void InsertarProveedor()
        {
            try
            {
                int agregar = 0;
                Proveedor proveedor = new Proveedor();

                proveedor.Nombre = txtNombre.Text;
                proveedor.Direccion = txtDireccion.Text;
                proveedor.id_Ciudad = Convert.ToInt32(DropDownCiudad.SelectedValue);
                proveedor.Telefono = txtTelefono.Text;
                proveedor.Email = txtCorreo.Text;
                proveedor.CP = txtCp.Text;
                proveedor.RFC = txtRFC.Text;      

                agregar = ProveedorDA.InsertarProveedor(proveedor);

                if (agregar > 0)
                {
                    LimpiarCajas(Page);
                    SeleccionaProveedores();
                    Response.Write("<script> alert(\" El cliente " + proveedor.Nombre + "ha sido creado exitosamente con el id: " + proveedor.id_Proveedor + " \"); </script>");
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            InsertarProveedor();
        }

        protected void GridViewProveedor_RowCommand(object sender, GridViewCommandEventArgs e)
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
                    Actualizar.Visible = true;
                    btnIngresar.Visible = false;
                    break;
                default:
                    Console.WriteLine("commando no permitido");
                    break;
            }
        }

        void Eliminar(int filaActual)
        {
            int id_Proveedor = (int)this.GridViewProveedor.DataKeys[filaActual]["id_Proveedor"];
            ProveedorDA.EliminaProveedor(id_Proveedor);

            LimpiarCajas(Page);
            SeleccionaProveedores();
        }

        void rellenarForm(int filaActual)
        {
            int id_Proveedor, id_Ciudad;
            string Nombre, Direccion, Telefono, Email, RFC, Cp;
            
            DataKey dk = GridViewProveedor.DataKeys[filaActual];

            int Proveedor = Convert.ToInt32(dk["id_Proveedor"]);

            id_Proveedor = (int)this.GridViewProveedor.DataKeys[filaActual]["id_Proveedor"];
            Nombre = (string)this.GridViewProveedor.DataKeys[filaActual]["Nombre"];
            Direccion = (string)this.GridViewProveedor.DataKeys[filaActual]["Direccion"];
            Telefono = (string)this.GridViewProveedor.DataKeys[filaActual]["Telefono"];
            Email = (string)this.GridViewProveedor.DataKeys[filaActual]["Email"];
            RFC = (string)this.GridViewProveedor.DataKeys[filaActual]["RFC"];
            Cp = (string)this.GridViewProveedor.DataKeys[filaActual]["CP"];
            id_Ciudad = (int)this.GridViewProveedor.DataKeys[filaActual]["id_Ciudad"];

            txtId.ReadOnly = true;
            txtId.Text = id_Proveedor.ToString();
            txtNombre.Text = Nombre;
            txtDireccion.Text = Direccion;
            DropDownCiudad.SelectedValue = id_Ciudad.ToString();
            txtTelefono.Text = Telefono;
            txtCorreo.Text = Email;
            txtRFC.Text = RFC;
            txtCp.Text = Cp;
            
            btnIngresar.Enabled = false;
            

        }

        protected void Actualizar_Click(object sender, EventArgs e)
        {
            actualizar();
        }

        void actualizar()
        {
            try
            {
                int agregar = 0;

                Proveedor proveedor = new Proveedor();

                proveedor.id_Proveedor = Convert.ToInt32(txtId.Text);
                proveedor.Nombre = txtNombre.Text;
                proveedor.Direccion = txtDireccion.Text;
                proveedor.Telefono = txtTelefono.Text;
                proveedor.id_Ciudad = Convert.ToInt32(DropDownCiudad.SelectedValue);
                proveedor.Email = txtCorreo.Text;
                proveedor.RFC = txtRFC.Text;
                proveedor.CP = txtCp.Text;
                
                agregar = ProveedorDA.ActualizaProveedor(proveedor);

                if (agregar > 0)
                {
                    LimpiarCajas(Page);
                    SeleccionaProveedores();

                    Response.Write("se ha actualizado el cliente exitosamente");
                    btnIngresar.Visible = true;                 
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void LimpiarCajas(Control p1)
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
                        LimpiarCajas(ctrl);
                    }                   
                }
            }
        }

        protected void btnLimpiar_Click(object sender, EventArgs e)
        {
            LimpiarCajas(Page);            
        }

        protected void GridViewProveedor_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }

        protected void GridViewProveedor_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {

        }

    }

    
}