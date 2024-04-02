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
require 'google/compute/property/regionurlmap_path_matchers_route_rules_match_rules_header_matches'
require 'google/compute/property/regionurlmap_path_matchers_route_rules_match_rules_metadata_filters'
require 'google/compute/property/regionurlmap_path_matchers_route_rules_match_rules_query_parameter_matches'
module GoogleInSpec
  module Compute
    module Property
      class RegionUrlMapPathMatchersRouteRulesMatchRules
        attr_reader :prefix_match

        attr_reader :full_path_match

        attr_reader :regex_match

        attr_reader :ignore_case

        attr_reader :header_matches

        attr_reader :query_parameter_matches

        attr_reader :metadata_filters

        attr_reader :path_template_match

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @prefix_match = args['prefixMatch']
          @full_path_match = args['fullPathMatch']
          @regex_match = args['regexMatch']
          @ignore_case = args['ignoreCase']
          @header_matches = GoogleInSpec::Compute::Property::RegionUrlMapPathMatchersRouteRulesMatchRulesHeaderMatchesArray.parse(args['headerMatches'], to_s)
          @query_parameter_matches = GoogleInSpec::Compute::Property::RegionUrlMapPathMatchersRouteRulesMatchRulesQueryParameterMatchesArray.parse(args['queryParameterMatches'], to_s)
          @metadata_filters = GoogleInSpec::Compute::Property::RegionUrlMapPathMatchersRouteRulesMatchRulesMetadataFiltersArray.parse(args['metadataFilters'], to_s)
          @path_template_match = args['pathTemplateMatch']
        end

        def to_s
          "#{@parent_identifier} RegionUrlMapPathMatchersRouteRulesMatchRules"
        end
      end

      class RegionUrlMapPathMatchersRouteRulesMatchRulesArray
        def self.parse(value, parent_identifier)
          return if value.nil?
          return RegionUrlMapPathMatchersRouteRulesMatchRules.new(value, parent_identifier) unless value.is_a?(::Array)
          value.map { |v| RegionUrlMapPathMatchersRouteRulesMatchRules.new(v, parent_identifier) }
        end
      end
    end
  end
end
