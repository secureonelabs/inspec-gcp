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
require 'google/dlp/property/dt_config_info_type_tf_tf_primitive_tf_character_mask_config_characters_to_ignore'
module GoogleInSpec
  module DLP
    module Property
      class DTConfigInfoTypeTfTfPrimitiveTfCharacterMaskConfig
        attr_reader :masking_character

        attr_reader :number_to_mask

        attr_reader :reverse_order

        attr_reader :characters_to_ignore

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @masking_character = args['maskingCharacter']
          @number_to_mask = args['numberToMask']
          @reverse_order = args['reverseOrder']
          @characters_to_ignore = GoogleInSpec::DLP::Property::DTConfigInfoTypeTfTfPrimitiveTfCharacterMaskConfigCharactersToIgnoreArray.parse(args['charactersToIgnore'], to_s)
        end

        def to_s
          "#{@parent_identifier} DTConfigInfoTypeTfTfPrimitiveTfCharacterMaskConfig"
        end
      end
    end
  end
end
