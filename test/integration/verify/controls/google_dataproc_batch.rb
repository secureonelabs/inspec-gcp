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

title 'Test GCP google_dataproc_batch resource.'

gcp_project_id = input(:gcp_project_id, value: 'gcp_project_id', description: 'The GCP project identifier.')

batch = input('batch', value: {
  "name": "projects/ppradhan/locations/us-central1/batches/inspec-test-batch-0052",
  "parent": "projects/ppradhan/locations/us-central1",
  "uuid": "5a1b8402-2aa5-4578-98ee-2ff12ff2a14e",
  "create_time": "2024-10-15T06:42:29.671473Z",
  "state": "SUCCEEDED",
  "state_time": "2024-10-15T06:44:55.114445Z",
  "creator": "bala-local@ppradhan.iam.gserviceaccount.com",
  "operation": "projects/ppradhan/regions/us-central1/operations/19a2ac29-3564-49b8-8116-c36dd98d9cd5"
}, description: 'batch description')
control 'google_dataproc_batch-1.0' do
  impact 1.0
  title 'google_dataproc_batch resource test'

  describe google_dataproc_batch(name: batch['name']) do
  	it { should exist }
  	its('name') { should cmp batch['name'] }
  	its('uuid') { should cmp batch['uuid'] }
  	its('create_time') { should cmp batch['create_time'] }
  	its('state') { should cmp batch['state'] }
  	its('state_message') { should cmp batch['state_message'] }
  	its('state_time') { should cmp batch['state_time'] }
  	its('creator') { should cmp batch['creator'] }
  	its('operation') { should cmp batch['operation'] }

  end

  describe google_dataproc_batch(name: "does_not_exit") do
  	it { should_not exist }
  end
end
