﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebFacturacion3.BussinessObjectsLayer
{
    public class DetalleFactura
    {

        #region Properties

        public Int32 Folio_Fact 
        {
            get;
            set;
        }

        public Int32 Id_Prod
        {
            get;
            set;
        }

        public Int32 Consecutivo_Det
        {
            get;
            set;
        }

        public Int32 Cantidad_Det
        {
            get;
            set;
        }

        public double Subtotal_Det 
        {
            get;
            set;
        }
        #endregion

    }
}