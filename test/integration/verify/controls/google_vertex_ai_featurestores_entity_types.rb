# ----------------------------------------------------------------------------
#
#     ***     AUTO GENERATED CODE    ***    Type: MMv1     ***
#
# ----------------------------------------------------------------------------
#
#     This file is automatically generated by Magic Modules and manual
#     changes will be clobbered when the file is regenerated.
#
#     Please read more about how to change this file in README.md and
#     CONTRIBUTING.md located at the root of this package.
#
# ----------------------------------------------------------------------------

title 'Test GCP google_vertex_ai_featurestores_entity_types resource.'

gcp_project_id = input(:gcp_project_id, value: 'gcp_project_id', description: 'The GCP project identifier.')

  featurestores_entity_type = input('featurestores_entity_type', value: {
  "name": "value_name",
  "region": "value_region",
  "parent": "value_parent",
  "description": "value_description",
  "create_time": "value_createtime",
  "etag": "value_etag",
  "update_time": "value_updatetime"
}, description: 'featurestores_entity_type description')
control 'google_vertex_ai_featurestores_entity_types-1.0' do
  impact 1.0
  title 'google_vertex_ai_featurestores_entity_types resource test'

      describe google_vertex_ai_featurestores_entity_types(parent: "projects/#{gcp_project_id}/locations/#{featurestores_entity_type['region']}/featurestores/#{featurestores_entity_type['featurestore']}", region: featurestores_entity_type['region']) do
      it { should exist }
    end
end
