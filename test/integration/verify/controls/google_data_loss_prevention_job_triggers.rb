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

title 'Test GCP google_data_loss_prevention_job_triggers resource.'

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
  "job_attribute_name": "job_attribute-1",
  "job_trigger_status": "HEALTHY",
  "job_trigger_name": "name1",
  "job_trigger_display_name": "dp",
  "job_trigger_description": "description"
}, description: 'DLP ')
control 'google_data_loss_prevention_job_triggers-1.0' do
  impact 1.0
  title 'google_data_loss_prevention_job_triggers resource test'



  describe google_data_loss_prevention_job_triggers(parent: "projects/#{gcp_project_id}/locations/#{dlp['location']}") do
  it { should exist }
  its('names') { should include dlp['job_trigger_name'] }
  its('display_name') { should include dlp['job_trigger_display_name'] }
  its('descriptions') { should include dlp['job_trigger_description'] }
  its('status') { should include dlp['job_trigger_status'] }
  end
end
