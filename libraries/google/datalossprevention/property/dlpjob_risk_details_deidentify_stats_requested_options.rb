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
require 'google/datalossprevention/property/dlpjob_risk_details_deidentify_stats_requested_options_details'
module GoogleInSpec
  module DataLossPrevention
    module Property
      class DlpJobRiskDetailsDeidentifyStatsRequestedOptions
        attr_reader :code

        attr_reader :message

        attr_reader :details

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @code = args['code']
          @message = args['message']
          @details = GoogleInSpec::DataLossPrevention::Property::DlpJobRiskDetailsDeidentifyStatsRequestedOptionsDetailsArray.parse(args['details'], to_s)
        end

        def to_s
          "#{@parent_identifier} DlpJobRiskDetailsDeidentifyStatsRequestedOptions"
        end
      end
    end
  end
end
