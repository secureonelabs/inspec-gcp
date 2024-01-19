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

title 'Test GCP google_compute_global_network_endpoint_group resource.'

gcp_project_id = input(:gcp_project_id, value: 'gcp_project_id', description: 'The GCP project identifier.')
global_network_endpoint_group = input('global_network_endpoint_group', value: {
  "name": "inspec-gcp-global-endpoint-group",
  "network_endpoint_type": "INTERNET_IP_PORT",
  "default_port": 90
}, description: 'Network endpoint group description')

control 'google_compute_global_network_endpoint_group-1.0' do
  impact 1.0
  title 'google_compute_global_network_endpoint_group resource test'


  describe google_compute_global_network_endpoint_group(project: gcp_project_id, name: global_network_endpoint_group['name']) do
    it { should exist }
    its('default_port') { should cmp global_network_endpoint_group['default_port'] }
    its('network_endpoint_type'){ should cmp global_network_endpoint_group['network_endpoint_type'] }
  end

  describe google_compute_global_network_endpoint_group(project: gcp_project_id, name: 'nonexistent') do
    it { should_not exist }
  end
end
