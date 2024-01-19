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
require 'google/dlp/property/inspecttemplate_inspect_config_rule_set_rules_exclusion_rule_exclude_info_types_info_types'
module GoogleInSpec
  module DLP
    module Property
      class InspectTemplateInspectConfigRuleSetRulesExclusionRuleExcludeInfoTypes
        attr_reader :info_types

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @info_types = GoogleInSpec::DLP::Property::InspectTemplateInspectConfigRuleSetRulesExclusionRuleExcludeInfoTypesInfoTypesArray.parse(args['infoTypes'], to_s)
        end

        def to_s
          "#{@parent_identifier} InspectTemplateInspectConfigRuleSetRulesExclusionRuleExcludeInfoTypes"
        end
      end
    end
  end
end
