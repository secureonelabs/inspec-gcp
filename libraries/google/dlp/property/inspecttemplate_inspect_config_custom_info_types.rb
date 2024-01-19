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
require 'google/dlp/property/inspecttemplate_inspect_config_custom_info_types_dictionary'
require 'google/dlp/property/inspecttemplate_inspect_config_custom_info_types_dictionary_cloud_storage_path'
require 'google/dlp/property/inspecttemplate_inspect_config_custom_info_types_dictionary_word_list'
require 'google/dlp/property/inspecttemplate_inspect_config_custom_info_types_info_type'
require 'google/dlp/property/inspecttemplate_inspect_config_custom_info_types_regex'
require 'google/dlp/property/inspecttemplate_inspect_config_custom_info_types_stored_type'
module GoogleInSpec
  module DLP
    module Property
      class InspectTemplateInspectConfigCustomInfoTypes
        attr_reader :info_type

        attr_reader :likelihood

        attr_reader :exclusion_type

        attr_reader :regex

        attr_reader :dictionary

        attr_reader :stored_type

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @info_type = GoogleInSpec::DLP::Property::InspectTemplateInspectConfigCustomInfoTypesInfoType.new(args['infoType'], to_s)
          @likelihood = args['likelihood']
          @exclusion_type = args['exclusionType']
          @regex = GoogleInSpec::DLP::Property::InspectTemplateInspectConfigCustomInfoTypesRegex.new(args['regex'], to_s)
          @dictionary = GoogleInSpec::DLP::Property::InspectTemplateInspectConfigCustomInfoTypesDictionary.new(args['dictionary'], to_s)
          @stored_type = GoogleInSpec::DLP::Property::InspectTemplateInspectConfigCustomInfoTypesStoredType.new(args['storedType'], to_s)
        end

        def to_s
          "#{@parent_identifier} InspectTemplateInspectConfigCustomInfoTypes"
        end
      end

      class InspectTemplateInspectConfigCustomInfoTypesArray
        def self.parse(value, parent_identifier)
          return if value.nil?
          return InspectTemplateInspectConfigCustomInfoTypes.new(value, parent_identifier) unless value.is_a?(::Array)
          value.map { |v| InspectTemplateInspectConfigCustomInfoTypes.new(v, parent_identifier) }
        end
      end
    end
  end
end
