using { sap.facturas as my } from '../db/schema';

service FacturaService {
    @odata.draft.enabled
    entity Facturas as projection on my.Facturas;
    
    entity Proveedores as projection on my.Proveedores;
}
