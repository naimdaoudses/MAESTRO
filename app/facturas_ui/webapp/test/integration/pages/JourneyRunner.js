sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"facturasui/test/integration/pages/FacturasList",
	"facturasui/test/integration/pages/FacturasObjectPage"
], function (JourneyRunner, FacturasList, FacturasObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('facturasui') + '/test/flp.html#app-preview',
        pages: {
			onTheFacturasList: FacturasList,
			onTheFacturasObjectPage: FacturasObjectPage
        },
        async: true
    });

    return runner;
});

