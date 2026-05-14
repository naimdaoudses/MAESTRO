const cds = require('@sap/cds');

module.exports = cds.service.impl(async function() {
    const bpa = await cds.connect.to('SAP_BPA');

    this.on('dispararProceso', async (req) => {
        try {
            const respuesta = await bpa.send('POST', '/workflow-service/rest/v1/workflow-instances', {
                definitionId: "us10.sap-probando.smartinvoice.invoiceProccess",
                context: {
                    // Ajustado para coincidir exactamente con BPA
                    "archivoNombre": req.data.nombre, // O el campo que recibas de la UI
                    "contenido": req.data.monto      // O el contenido del archivo
                }
            });
            return "Proceso iniciado con éxito";
        } catch (error) {
            // Esto te ayudará a ver qué falló exactamente en la consola
            console.error("Error detallado:", error);
            req.error(500, `Error al conectar con BPA: ${error.message}`);
        }
    });
});