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
require 'google/dlp/property/job_act_det_deidentify_stats_requested_options_details'
module GoogleInSpec
  module DLP
    module Property
      class JobActDetDeidentifyStatsRequestedOptions
        attr_reader :code

        attr_reader :message

        attr_reader :details

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @code = args['code']
          @message = args['message']
          @details = GoogleInSpec::DLP::Property::JobActDetDeidentifyStatsRequestedOptionsDetailsArray.parse(args['details'], to_s)
        end

        def to_s
          "#{@parent_identifier} JobActDetDeidentifyStatsRequestedOptions"
        end
      end
    end
  end
end
