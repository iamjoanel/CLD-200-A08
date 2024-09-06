using RiskService as service from '../../srv/risk-service';
annotate service.Risks with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Title}',
                Value : title,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Owner}',
                Value : owner,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Priority}',
                Value : prio_code,
            },
            {
                $Type : 'UI.DataField',
                Label : 'descr',
                Value : descr,
            },
            {
                $Type : 'UI.DataField',
                Label : 'impact',
                Value : impact,
            },
            {
                $Type : 'UI.DataField',
                Label : 'criticality',
                Value : criticality,
            },
            {
                $Type : 'UI.DataField',
                Label : 'PrioCriticality',
                Value : PrioCriticality,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.CollectionFacet',
            Label : 'Risk Group',
            ID : 'RiskGroup',
            Facets : [
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : 'Risk Details Form',
                    ID : 'RiskDetailsForm',
                    Target : '@UI.FieldGroup#RiskDetailsForm',
                },
            ],
        },
        {
            $Type : 'UI.CollectionFacet',
            Label : 'Mitigation Group',
            ID : 'MitigationGroup',
            Facets : [
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : 'Mitigation Details Form',
                    ID : 'MitigationDetailsForm',
                    Target : '@UI.FieldGroup#MitigationDetailsForm',
                },
            ],
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Title}',
            Value : title,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Owner}',
            Value : owner,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Priority}',
            Value : prio_code,
            Criticality : PrioCriticality,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Impact}',
            Value : impact,
            Criticality : criticality,
        },
        {
            $Type : 'UI.DataField',
            Value : miti.descr,
            Label : '{i18n>Description}',
        },
        {
            $Type : 'UI.DataFieldForAnnotation',
            Target : 'bp/@Communication.Contact#contact',
            Label : '{i18n>BusinessPartner}',
        },
    ],
    UI.SelectionFields : [
        prio_code,
    ],
    UI.HeaderInfo : {
        Title : {
            $Type : 'UI.DataField',
            Value : title,
        },
        TypeName : '',
        TypeNamePlural : '',
        Description : {
            $Type : 'UI.DataField',
            Value : miti.descr,
        },
    },
    UI.FieldGroup #RiskDetailsForm : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : title,
                Label : '{i18n>Title}',
            },
            {
                $Type : 'UI.DataField',
                Value : owner,
                Label : '{i18n>Owner}',
                ![@UI.Hidden],
            },
            {
                $Type : 'UI.DataField',
                Value : descr,
                Label : '{i18n>Description}',
            },
            {
                $Type : 'UI.DataField',
                Value : prio_code,
                Criticality : PrioCriticality,
            },
            {
                $Type : 'UI.DataField',
                Value : impact,
                Label : '{i18n>Impact}',
                Criticality : criticality,
            },
            {
                $Type : 'UI.DataFieldForAnnotation',
                Target : 'bp/@Communication.Contact#contact1',
                Label : '{i18n>BusinessPartner}',
            },
        ],
    },
    UI.FieldGroup #MitigationDetailsForm : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : miti.ID,
                Label : '{i18n>Mitigation}',
            },
            {
                $Type : 'UI.DataField',
                Value : miti.owner,
                Label : '{i18n>Owner}',
            },
            {
                $Type : 'UI.DataField',
                Value : miti.timeline,
                Label : '{i18n>Timeline}',
            },
        ],
    },
);

annotate service.Risks with {
    miti @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Mitigations',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : miti_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'descr',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'owner',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'timeline',
            },
        ],
    }
};

annotate service.Risks with {
    prio @(
        Common.Label : '{i18n>Priority}',
        Common.Text : {
            $value : prio.descr,
            ![@UI.TextArrangement] : #TextOnly
        },
    )
};

annotate service.Mitigations with {
    ID @Common.Text : {
        $value : descr,
        ![@UI.TextArrangement] : #TextOnly
    }
};

annotate service.Mitigations with {
    owner @Common.FieldControl : #ReadOnly
};

annotate service.Mitigations with {
    timeline @Common.FieldControl : #ReadOnly
};

annotate service.BusinessPartners with @(
    Communication.Contact #contact : {
        $Type : 'Communication.ContactType',
        fn : FullName,
    },
    Communication.Contact #contact1 : {
        $Type : 'Communication.ContactType',
        fn : FullName,
    },
);

