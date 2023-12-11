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
  module Orgpolicy
    module Property
      class OrganizationPolicyAlternateSpecRulesValues
        attr_reader :denied_values

        attr_reader :allowed_values

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @denied_values = args['deniedValues']
          @allowed_values = args['allowedValues']
        end

        def to_s
          "#{@parent_identifier} OrganizationPolicyAlternateSpecRulesValues"
        end
      end
    end
  end
end
