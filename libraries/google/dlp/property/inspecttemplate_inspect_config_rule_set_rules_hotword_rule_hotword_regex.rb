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
module GoogleInSpec
  module DLP
    module Property
      class InspectTemplateInspectConfigRuleSetRulesHotwordRuleHotwordRegex
        attr_reader :pattern

        attr_reader :group_indexes

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @pattern = args['pattern']
          @group_indexes = args['groupIndexes']
        end

        def to_s
          "#{@parent_identifier} InspectTemplateInspectConfigRuleSetRulesHotwordRuleHotwordRegex"
        end
      end
    end
  end
end
