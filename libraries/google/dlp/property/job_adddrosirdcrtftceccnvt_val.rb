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
      class JobActDetDtDetReqOptSnapshotImgRtDtConRecTfFieldTfConExpsConCondNewValTimeVal
        attr_reader :hours

        attr_reader :minutes

        attr_reader :seconds

        attr_reader :nanos

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @hours = args['hours']
          @minutes = args['minutes']
          @seconds = args['seconds']
          @nanos = args['nanos']
        end

        def to_s
          "#{@parent_identifier} JobActDetDtDetReqOptSnapshotImgRtDtConRecTfFieldTfConExpsConCondNewValTimeVal"
        end
      end
    end
  end
end
