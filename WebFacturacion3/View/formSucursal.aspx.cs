using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebFacturacion3.DataAccessLayer;
using WebFacturacion3.BussinessObjectsLayer;

namespace WebFacturacion3.View
{
    public partial class formSucursal : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Actualizar.Visible = false;
            if (!IsPostBack)
            {
                SeleccionaSucursales();
                LlenaDropDownListCiudades();
            }
            
        }

        void SeleccionaSucursales()
        {
            Int32? idSucursal = null;
            String nombre = String.Empty;

            GridViewSucursal.DataSource = SucursalDA.SeleccionaSucursal(idSucursal, nombre);
            GridViewSucursal.DataBind();
        }

        void LlenaDropDownListCiudades()
        {
            DropDownCiudad.DataSource = CiudadDA.SeleccionaCiudades();
            DropDownCiudad.DataTextField = "Nombre";
            DropDownCiudad.DataValueField = "id_Ciudad";
            DropDownCiudad.DataBind();
        }

        void InsertarSucursal()
        {
            try
            {
                int agregar = 0;
                Sucursal sucursal = new Sucursal();

                sucursal.Nombre = txtNombre.Text;
                sucursal.Direccion = txtDireccion.Text;
                sucursal.id_Ciudad = Convert.ToInt32(DropDownCiudad.SelectedValue);                
                sucursal.Telefono = txtTelefono.Text;

                agregar = SucursalDA.InsertarSucursal(sucursal);

                if (agregar > 0)
                {
                    LimpiarCajas(Page);
                       SeleccionaSucursales();
                   Response.Write("<script> alert(\" La sucursal " + sucursal.Nombre + "ha sido creado exitosamente con el id: " + sucursal.id_Sucursal + " \"); </script>");
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            InsertarSucursal();
        }

        protected void GridViewSucursal_RowCommand(object sender, GridViewCommandEventArgs e)
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
            int id_Sucursal = (int)this.GridViewSucursal.DataKeys[filaActual]["id_Sucursal"];
            SucursalDA.EliminaSucursal(id_Sucursal);

            LimpiarCajas(Page);
            SeleccionaSucursales();
        }

        void rellenarForm(int filaActual)
        {
            int id_Sucursal, idCiudad;
            string Nombre, Direccion, Telefono;


            DataKey dk = GridViewSucursal.DataKeys[filaActual];

            int sucursal = Convert.ToInt32(dk["id_Sucursal"]);

            id_Sucursal = (int)this.GridViewSucursal.DataKeys[filaActual]["id_Sucursal"];
            Nombre = (string)this.GridViewSucursal.DataKeys[filaActual]["Nombre"];
            Direccion = (string)this.GridViewSucursal.DataKeys[filaActual]["Direccion"];
            Telefono = (string)this.GridViewSucursal.DataKeys[filaActual]["Telefono"];
            idCiudad = (int)this.GridViewSucursal.DataKeys[filaActual]["id_Ciudad"];
            

            txtId.ReadOnly = true;
            txtId.Text = id_Sucursal.ToString();
            txtNombre.Text = Nombre;
            txtDireccion.Text = Direccion;
            txtTelefono.Text = Telefono;
            DropDownCiudad.SelectedValue = idCiudad.ToString();

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


                Sucursal sucursal = new Sucursal();

                sucursal.id_Sucursal = Convert.ToInt32(txtId.Text);
                sucursal.Nombre = txtNombre.Text;
                sucursal.Direccion = txtDireccion.Text;
                sucursal.Telefono = txtTelefono.Text;
                sucursal.id_Ciudad = Convert.ToInt32(DropDownCiudad.SelectedValue);

                agregar = SucursalDA.ActualizaSucursal(sucursal);

                if (agregar > 0)
                {
                    LimpiarCajas(Page);
                    SeleccionaSucursales();

                    Response.Write("se ha actualizado sucursal exitosamente");
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
                    btnIngresar.Enabled = true;
                }

            }

        }

     

        protected void GridViewSucursal_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }

        protected void GridViewSucursal_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {

        }

        protected void GridViewSucursal_RowCommand1(object sender, GridViewCommandEventArgs e)
        {

        }
    }
}