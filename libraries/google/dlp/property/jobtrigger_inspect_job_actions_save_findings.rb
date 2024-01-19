# frozen_string_literal: false

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
require 'google/dlp/property/jobtrigger_inspect_job_actions_save_findings_output_config'
require 'google/dlp/property/jobtrigger_inspect_job_actions_save_findings_output_config_table'
module GoogleInSpec
  module DLP
    module Property
      class JobTriggerInspectJobActionsSaveFindings
        attr_reader :output_config

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @output_config = GoogleInSpec::DLP::Property::JobTriggerInspectJobActionsSaveFindingsOutputConfig.new(args['outputConfig'], to_s)
        end

        def to_s
          "#{@parent_identifier} JobTriggerInspectJobActionsSaveFindings"
        end
      end
    end
  end
end
