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

title 'Test GCP google_compute_region_commitment resource.'

gcp_project_id = input(:gcp_project_id, value: 'gcp_project_id', description: 'The GCP project identifier.')

region_commitment = input('region_commitment', value: {
  "project": "ppradhan",
  "region": "us-central1",
  "full_region": "https://www.googleapis.com/compute/v1/projects/ppradhan/regions/us-central1",
  "target_vpn_gateway": "value_targetvpngateway",
  "kind": "compute#commitment",
  "name": "my-region-commitment",
  "self_link": "https://www.googleapis.com/compute/v1/projects/ppradhan/regions/us-central1/commitments/my-region-commitment",
  "status": "NOT_YET_ACTIVE",
  "status_message": "The commitment is not yet active (its startTimestamp is in the future). It will not apply to current resource usage.",
  "plan": "THIRTY_SIX_MONTH",
  "type": "GENERAL_PURPOSE",
  "category": "MACHINE",
}, description: 'region_commitment description')
control 'google_compute_region_commitment-1.0' do
  impact 1.0
  title 'google_compute_region_commitment resource test'

  describe google_compute_region_commitment(name: region_commitment['name'], project: gcp_project_id, region: region_commitment['region']) do
  	it { should exist }
  	its('kind') { should cmp region_commitment['kind'] }
  	its('name') { should cmp region_commitment['name'] }
  	its('region') { should cmp region_commitment['full_region'] }
  	its('self_link') { should cmp region_commitment['self_link'] }
  	its('status') { should cmp region_commitment['status'] }
  	its('status_message') { should cmp region_commitment['status_message'] }
  	its('plan') { should cmp region_commitment['plan'] }
  	its('type') { should cmp region_commitment['type'] }
  	its('category') { should cmp region_commitment['category'] }
  end

  describe google_compute_region_commitment(name: "donotexist", project: gcp_project_id, region: region_commitment['region']) do
  	it { should_not exist }
  end
end
