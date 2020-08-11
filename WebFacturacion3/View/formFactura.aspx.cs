using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebFacturacion3.BussinessObjectsLayer;
using WebFacturacion3.DataAccessLayer;

namespace WebFacturacion3.View
{
   
    public partial class Facturas : System.Web.UI.Page      
    {
        public int productoSeleccionado1, facturaSeleccionada;

        protected void Page_Load(object sender, EventArgs e)
        {
            Selecciona();
            Int32? idCliente = null;
            String nombre = String.Empty;
            String rfc = String.Empty;
           /* Int32? idProducto = null; */

            dropDownClientes.DataSource = ClienteDA.SeleccionaClientes(idCliente, nombre, rfc);
            dropDownClientes.DataTextField = "Nombre";
            dropDownClientes.DataValueField = "id_Cliente";
            dropDownClientes.DataBind();
            /*
            DropDownList1.DataSource = ProductoDA.SeleccionaProductos(idProducto);
            DropDownList1.DataTextField = "DescripcionProducto";
            DropDownList1.DataValueField = "id_Producto";
            DropDownList1.DataBind();
            */
        }

        /*
        public void Selecciona(Int32? idDetalle) {            
            GridViewDetalleFactura.DataSource = DetalleFacturaDA.SeleccionaDetalleFactura(idDetalle);
            GridViewDetalleFactura.DataBind();
        }
        */
        
        public void dropDownClientes_SelectedIndexChanged(object sender, EventArgs e)
        {                      
        }

        void Selecciona()
        {
            Int32 Folio_Cte = 0;

            GVFactura.DataSource = FacturaDA.SeleccionaFacturas(Folio_Cte);
            GVFactura.DataBind();
        }


        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            GenerarFactura();
        }

        public Int32 GenerarFactura()
        {
            int guardarFactura = 0;

            Factura fact    = new Factura();
            fact.Id_cte     = Convert.ToInt32(dropDownClientes.SelectedValue);
            fact.Total_Fact = 0;
            fact.Fecha_Fact = Convert.ToDateTime(txtDate.Text);

            guardarFactura = FacturaDA.InsertarFactura(fact);

            if (guardarFactura != 0) { 
                txtFolio.Text = guardarFactura.ToString();
                btnGuardar.Enabled = false;
                /* btnAgregarDetalle.Enabled = true; */
            }

            return facturaSeleccionada;
        }

        /*
        protected void btnAgregarDetalle_Click(object sender, EventArgs e)
        {
            try
            {
                Producto producto = ProductoDA.SeleccionaProductos(productoSeleccionado1).FirstOrDefault();
                double SubTotal   = producto.PrecioProd * Convert.ToInt32(txtCantidad1.Text);

                DetalleFactura dte  = new DetalleFactura();
                dte.Folio_Fact      = Convert.ToInt32(txtFolio.Text);
                dte.Consecutivo_Det = 1;
                dte.Id_Prod         = producto.id_Producto;
                dte.Cantidad_Det    = Convert.ToInt32(txtCantidad1.Text);
                dte.Subtotal_Det    = SubTotal;

                DetalleFacturaDA.InsertarDetalleFactura(dte);
                Selecciona(Convert.ToInt32(txtFolio.Text));

                Factura facturaActual = FacturaDA.SeleccionaFacturas(Convert.ToInt32(txtFolio.Text)).FirstOrDefault();
                txtTotal.Text = facturaActual.Total_Fact.ToString();
                
                Response.Write("Factura generada correctamente!");
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            productoSeleccionado1 = Convert.ToInt32(DropDownList1.SelectedValue);
            Producto producto = ProductoDA.SeleccionaProductos(productoSeleccionado1).FirstOrDefault();
            double subtotal   = producto.PrecioProd * Convert.ToInt32(txtCantidad1.Text);

            txtPrecio.Text = producto.PrecioProd.ToString();
            txtSubtotal.Text = subtotal.ToString();

        }
        */
    }
}