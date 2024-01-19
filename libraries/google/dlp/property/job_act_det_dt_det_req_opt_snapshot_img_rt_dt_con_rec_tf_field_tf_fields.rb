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
      class JobActDetDtDetReqOptSnapshotImgRtDtConRecTfFieldTfFields
        attr_reader :name

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @name = args['name']
        end

        def to_s
          "#{@parent_identifier} JobActDetDtDetReqOptSnapshotImgRtDtConRecTfFieldTfFields"
        end
      end

      class JobActDetDtDetReqOptSnapshotImgRtDtConRecTfFieldTfFieldsArray
        def self.parse(value, parent_identifier)
          return if value.nil?
          return JobActDetDtDetReqOptSnapshotImgRtDtConRecTfFieldTfFields.new(value, parent_identifier) unless value.is_a?(::Array)
          value.map { |v| JobActDetDtDetReqOptSnapshotImgRtDtConRecTfFieldTfFields.new(v, parent_identifier) }
        end
      end
    end
  end
end
