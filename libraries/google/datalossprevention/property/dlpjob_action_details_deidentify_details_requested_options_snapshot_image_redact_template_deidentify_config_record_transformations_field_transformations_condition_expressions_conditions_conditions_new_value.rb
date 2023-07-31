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
require 'google/datalossprevention/property/dlpjob_action_details_deidentify_details_requested_options_snapshot_image_redact_template_deidentify_config_record_transformations_field_transformations_condition_expressions_conditions_conditions_new_value_date_value'
require 'google/datalossprevention/property/dlpjob_action_details_deidentify_details_requested_options_snapshot_image_redact_template_deidentify_config_record_transformations_field_transformations_condition_expressions_conditions_conditions_new_value_time_value'
module GoogleInSpec
  module DataLossPrevention
    module Property
      class DlpJobActionDetailsDeidentifyDetailsRequestedOptionsSnapshotImageRedactTemplateDeidentifyConfigRecordTransformationsFieldTransformationsConditionExpressionsConditionsConditionsNewValue
        attr_reader :integer_value

        attr_reader :float_value

        attr_reader :string_value

        attr_reader :boolean_value

        attr_reader :timestamp_value

        attr_reader :time_value

        attr_reader :date_value

        attr_reader :day_of_week_value

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @integer_value = args['integerValue']
          @float_value = args['floatValue']
          @string_value = args['stringValue']
          @boolean_value = args['booleanValue']
          @timestamp_value = args['timestampValue']
          @time_value = GoogleInSpec::DataLossPrevention::Property::DlpJobActionDetailsDeidentifyDetailsRequestedOptionsSnapshotImageRedactTemplateDeidentifyConfigRecordTransformationsFieldTransformationsConditionExpressionsConditionsConditionsNewValueTimeValue.new(args['timeValue'], to_s)
          @date_value = GoogleInSpec::DataLossPrevention::Property::DlpJobActionDetailsDeidentifyDetailsRequestedOptionsSnapshotImageRedactTemplateDeidentifyConfigRecordTransformationsFieldTransformationsConditionExpressionsConditionsConditionsNewValueDateValue.new(args['dateValue'], to_s)
          @day_of_week_value = args['dayOfWeekValue']
        end

        def to_s
          "#{@parent_identifier} DlpJobActionDetailsDeidentifyDetailsRequestedOptionsSnapshotImageRedactTemplateDeidentifyConfigRecordTransformationsFieldTransformationsConditionExpressionsConditionsConditionsNewValue"
        end
      end
    end
  end
end
