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
require 'google/compute/property/regionsecuritypolicy_adaptive_protection_config_layer7_ddos_defense_config_threshold_configs'
module GoogleInSpec
  module Compute
    module Property
      class RegionSecurityPolicyAdaptiveProtectionConfigLayer7DdosDefenseConfig
        attr_reader :enable

        attr_reader :rule_visibility

        attr_reader :threshold_configs

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @enable = args['enable']
          @rule_visibility = args['ruleVisibility']
          @threshold_configs = GoogleInSpec::Compute::Property::RegionSecurityPolicyAdaptiveProtectionConfigLayer7DdosDefenseConfigThresholdConfigsArray.parse(args['thresholdConfigs'], to_s)
        end

        def to_s
          "#{@parent_identifier} RegionSecurityPolicyAdaptiveProtectionConfigLayer7DdosDefenseConfig"
        end
      end
    end
  end
end
