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

title 'Test GCP google_compute_resource_policies resource.'

gcp_project_id = input(:gcp_project_id, value: 'gcp_project_id', description: 'The GCP project identifier.')

  resource_policy = input('resource_policy', value: {
  "project": "value_project",
  "region": "value_region",
  "resource_policy": "value_resourcepolicy",
  "kind": "value_kind",
  "id": "value_id",
  "creation_timestamp": "value_creationtimestamp",
  "self_link": "value_selflink",
  "self_link_with_id": "value_selflinkwithid",
  "description": "value_description",
  "name": "value_name",
  "status": "value_status"
}, description: 'resource_policy description')
control 'google_compute_resource_policies-1.0' do
  impact 1.0
  title 'google_compute_resource_policies resource test'

      describe google_compute_resource_policies(project: gcp_project_id, region: resource_policy['region']) do
      it { should exist }
    end
end
