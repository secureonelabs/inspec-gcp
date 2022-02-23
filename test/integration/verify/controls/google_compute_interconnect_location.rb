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

title 'Test GCP google_compute_interconnect_location resource.'

gcp_project_id = attribute(:gcp_project_id, default: 'gcp_project_id', description: 'The GCP project identifier.')
interconnect_location = attribute('interconnect_location', default: {
  "name": "akl-zone1-1353",
  "facility_provider_facility_id": "Auckland - Albany",
  "facility_provider": "Vocus"
}, description: 'Retrieves the list of interconnect locations available to the specified project.')
control 'google_compute_interconnect_location-1.0' do
  impact 1.0
  title 'google_compute_interconnect_location resource test'

  describe google_compute_interconnect_location(project: gcp_project_id, name: interconnect_location['name']) do
    it { should exist }
    its('facility_provider_facility_id') { should eq interconnect_location['facility_provider_facility_id'] }
    its('facility_provider') { should eq interconnect_location['facility_provider'] }
  end

  describe google_compute_interconnect_location(project: gcp_project_id, name: 'nonexistent') do
    it { should_not exist }
  end
end
