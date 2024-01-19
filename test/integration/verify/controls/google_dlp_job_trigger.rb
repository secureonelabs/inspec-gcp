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

title 'Test GCP google_dlp_job_trigger resource.'

gcp_project_id = input(:gcp_project_id, value: 'gcp_project_id', description: 'The GCP project identifier.')
dlp = input('dlp', value: {
  "name": "i-inspec-gcp-dlp",
  "location": "us-east-2",
  "type": "INSPECT_JOB",
  "state": "ACTIVE",
  "inspectDetails": {
    "requestedOptions": {
      "snapshotInspectTemplate": "",
      "jobConfig": {
        "storageConfig": {
          "hybridOptions": {
            "description": "test",
            "tableOptions": ""
          }
        }
      }
    }
  },
  "description": "Description",
  "display_name": "Displayname",
  "job_attribute_name": "job_attribute-1",
  "job_trigger_status": "HEALTHY",
  "job_trigger_name": "name1",
  "job_trigger_display_name": "dp",
  "job_trigger_description": "description",
  "deidentify_templates": {
    "name": "dlp-template-inspec",
    "location": "europe-west2",
    "type": "Infotype"
  }
}, description: 'DLP ')
control 'google_dlp_job_trigger-1.0' do
  impact 1.0
  title 'google_dlp_job_trigger resource test'


  describe google_dlp_job_trigger(parent: "projects/#{gcp_project_id}/locations/#{dlp['location']}",name: dlp['job_trigger_name']) do
  it { should exist }
  its('name') { should cmp dlp['job_trigger_name'] }
  its('display_name') { should cmp dlp['job_trigger_display_name'] }
  its('description') { should cmp dlp['job_trigger_description'] }
  its('status') { should cmp dlp['job_trigger_status'] }
  end

  describe google_dlp_job_trigger(parent: gcp_project_id, name: 'nonexistent') do
  it { should_not exist }
  end
end
