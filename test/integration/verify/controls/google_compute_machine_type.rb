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

title 'Test GCP google_compute_machine_type resource.'

gcp_project_id = input(:gcp_project_id, value: 'gcp_project_id', description: 'The GCP project identifier.')

  machine_type = input('machine_type', value: {
  "project": "ppradhan",
  "zone": "us-central1-a",
  "kind": "compute#machineType",
  "id": "1000012",
  "creation_timestamp": "value_creationtimestamp",
  "name": "a2-highgpu-1g",
  "description": "value_description",
  "maximum_persistent_disks_size_gb": "value_maximumpersistentdiskssizegb",
  "self_link": "value_selflink"
}, description: 'machine_type description')
control 'google_compute_machine_type-1.0' do
  impact 1.0
  title 'google_compute_machine_type resource test'

  describe google_compute_machine_type(name: machine_type['name'], project: gcp_project_id, zone: machine_type['zone']) do
  	it { should exist }
  	its('kind') { should cmp machine_type['kind'] }
  	its('id') { should cmp machine_type['id'] }
  	its('creation_timestamp') { should cmp machine_type['creation_timestamp'] }
  	its('name') { should cmp machine_type['name'] }
  	its('description') { should cmp machine_type['description'] }
  	its('maximum_persistent_disks_size_gb') { should cmp machine_type['maximum_persistent_disks_size_gb'] }
  	its('zone') { should cmp machine_type['zone'] }
  	its('self_link') { should cmp machine_type['self_link'] }

  end

  describe google_compute_machine_type(name: machine_type['name'], project: gcp_project_id, zone: machine_type['zone']) do
  	it { should_not exist }
  end
end
