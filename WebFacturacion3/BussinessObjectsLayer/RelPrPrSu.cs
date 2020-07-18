using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebFacturacion3.BussinessObjectsLayer
{
    public class RelPrPrSu
    {
        #region Properties

        public Int32 id_RelPrPrSu
        {
            get;
            set;
        }

        public Int32 id_Producto
        {
            get;
            set;
        }

        public Int32 id_Proveedor
        {
            get;
            set;
        }

        public Int32 id_Sucursal
        {
            get;
            set;
        }

        public Double Precio_Unitario
        {
            get;
            set;
        }

        #endregion

    }
}