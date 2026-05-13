const cds = require('@sap/cds');

module.exports = cds.service.impl(async function() {
    const { Facturas } = this.entities;

    this.after('CREATE', 'Facturas', async (data, req) => {
        try {
            const bpa = await cds.connect.to('BPA_Service');

            const payload = {
                // AQUÍ PEGA EL ID QUE COPIASTE DEL MONITOR
                definitionId: "us10.sap-probando.smartinvoice.invoiceProccess", 
                context: {
                    // Solo mandamos un texto para probar
                    archivoNombre: "PRUEBA_CONEXION",
                    nroFactura: "TEST-001"
                }
            };

            console.log('>>> Intentando disparar BPA con datos de prueba...');
            await bpa.post('/workflow-instances', payload);
            console.log('>>> ¡CONEXIÓN EXITOSA! El mensaje llegó a BPA.');

        } catch (error) {
            console.error('>>> ERROR DE CONEXIÓN:', error.message);
            if (error.response) console.error('>>> Detalle:', error.response.data);
        }
    });
});