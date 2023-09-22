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

title 'Test GCP google_vertex_ai_studies_trials resource.'

gcp_project_id = input(:gcp_project_id, value: 'gcp_project_id', description: 'The GCP project identifier.')

  studies_trial = input('studies_trial', value: {
    "name": "1",
    "region": "us-central1",
    "parent": "projects/165434197229/locations/us-central1/studies/2975668570413/trials/",
    "study": "890385007008",
    "start_time": "value_starttime",
    "end_time": "value_endtime",
    "infeasible_reason": "value_infeasiblereason",
    "client_id": "value_clientid",
    "custom_job": "value_customjob",
    "state": "value_state",
    "id": "1"
}, description: 'studies_trial description')
control 'google_vertex_ai_studies_trials-1.0' do
  impact 1.0
  title 'google_vertex_ai_studies_trials resource test'

      describe google_vertex_ai_studies_trials(parent: "projects/#{gcp_project_id}/locations/#{studies_trial['region']}/studies/#{studies_trial['study']}", region: studies_trial['region']) do
      it { should exist }
    end
end
