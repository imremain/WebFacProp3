using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebFacturacion3.BussinessObjectsLayer;
using WebFacturacion3.DataAccessLayer;

namespace WebFacturacion3.View
{
    public partial class formProducto : System.Web.UI.Page
    {
        #region Methods

        void Insertar()
        {
            try
            {
                int agregar = 0;
                Producto prod = new Producto();

                prod.DescripcionProducto = txtDescripcion.Text;
                prod.PrecioProd = Convert.ToDouble(txtPrecio.Text);
                prod.FechaCaducidadProd = calendar.SelectedDate;
                prod.CodigoBarras_Prod = txtCodigoBarras.Text;
                prod.Proveedor_Prod = txtProveedor.Text;

                agregar = ProductoDA.InsertarProducto(prod);

                if (agregar > 0) {
                    Response.Write("El producto se a ingresado correctamente");
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

        void Eliminar(int filaActual)
        {
            int id_Producto = (int)this.GridViewProductos.DataKeys[filaActual]["id_Producto"];

            ProductoDA.EliminaProducto(id_Producto);
            Selecciona();
        }

        void rellenarForm(int filaActual)
        {
            int id_Producto;
            string Descripcion, CodigoBarras, Proveedor;
            DateTime FechaCaducidadProd;
            double Precio;

            id_Producto        = (int)this.GridViewProductos.DataKeys[filaActual]["id_Producto"];
            Descripcion        = (string)this.GridViewProductos.DataKeys[filaActual]["DescripcionProducto"];
            Precio             = (double)this.GridViewProductos.DataKeys[filaActual]["PrecioProd"];
            CodigoBarras       = (string)this.GridViewProductos.DataKeys[filaActual]["CodigoBarras_Prod"];
            Proveedor          = (string)this.GridViewProductos.DataKeys[filaActual]["Proveedor_Prod"];
            FechaCaducidadProd = (DateTime)this.GridViewProductos.DataKeys[filaActual]["FechaCaducidadProd"];


            txtIdProducto.ReadOnly = true;
            txtIdProducto.Text     = id_Producto.ToString();
            txtDescripcion.Text    = Descripcion;
            txtPrecio.Text         = Convert.ToString(Precio);
            txtCodigoBarras.Text   = CodigoBarras;
            txtProveedor.Text      = Proveedor;
            calendar.SelectedDate  = FechaCaducidadProd;

            btnIngresar.Enabled = false;
        }

        void actualizar()
        {
            try
            {
                int agregar = 0;

                Producto prod = new Producto();

                prod.id_Producto = Convert.ToInt32(txtIdProducto.Text);
                prod.DescripcionProducto = txtDescripcion.Text;
                prod.PrecioProd = Convert.ToDouble(txtPrecio.Text);
                prod.CodigoBarras_Prod = txtCodigoBarras.Text;
                prod.Proveedor_Prod = txtProveedor.Text;
                prod.FechaCaducidadProd = calendar.SelectedDate;

                agregar = ProductoDA.ActualizaProducto(prod);

                if (agregar > 0)
                {
                    LimpiarCajas(Page);                    

                    Response.Write("se a agregado el producto exitosamente");
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }


        }

        void Selecciona()
        {
            Int32? idProducto = null;

            GridViewProductos.DataSource = ProductoDA.SeleccionaProductos(idProducto);
            GridViewProductos.DataBind();
        }

        #endregion

        #region Events
        protected void Page_Load(object sender, EventArgs e)
        {
            Selecciona();
            txtIdProducto.ReadOnly = true;
        }

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
                default:
                    Console.WriteLine("commando no permitido");
                    break;
            }
        }
        protected void Actualizar_Click(object sender, EventArgs e)
        {
            actualizar();
        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            Insertar();
        }

        protected void GridViewProductos_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
        }

        protected void btnLimpiar_Click(object sender, EventArgs e)
        {
            LimpiarCajas(Page);
        }
       
        #endregion
    }
}