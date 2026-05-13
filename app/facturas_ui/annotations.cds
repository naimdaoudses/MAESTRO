using FacturaService as service from '../../srv/service';
annotate service.Facturas with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Archivo}',
                Value : content,
            },
            {
                $Type : 'UI.DataField',
                Value : fechaEmision,
                Label : 'Fecha de Emision',
            },
        ],
    },
    UI.HeaderInfo : {
        TypeName       : 'Factura',
        TypeNamePlural : 'Facturas',
        Title          : {
            $Type : 'UI.DataField',
            Value : nroFactura, // <--- Esto es lo que cambia el número de arriba
        },
        Description    : {
            $Type : 'UI.DataField',
            Value : 'Nueva Factura', // O puedes poner el nombre del proveedor
        }
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'Numero de Factura',
            Value : nroFactura,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Fecha de Emision',
            Value : fechaEmision,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Estado',
            Value : estado,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Documento',
            Value : content,
        },
    ],
    
);

annotate service.Facturas with {
    proveedor @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Proveedores',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : proveedor_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'nombre',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'cuit',
            },
        ],
    }
};

