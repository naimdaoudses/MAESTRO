namespace sap.facturas;

using { managed, cuid } from '@sap/cds/common';

entity Facturas : cuid, managed {
    nroFactura  : String;
    fechaEmision: Date;
    montoTotal  : Decimal(15, 2);
    estado      : String enum { Pendiente; Pagada; Anulada } default 'Pendiente';
    proveedor   : Association to Proveedores;
    content     : LargeBinary @Core.MediaType: mediaType;
    mediaType   : String @Core.IsMediaType;
    fileName    : String;
}

entity Proveedores : cuid {
    nombre : String;
    cuit   : String;
}