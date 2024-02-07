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
  module Dataflow
    module Property
      class ProjectLocationJobJobMetadataSdkVersionBugs
        attr_reader :type

        attr_reader :severity

        attr_reader :uri

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @type = args['type']
          @severity = args['severity']
          @uri = args['uri']
        end

        def to_s
          "#{@parent_identifier} ProjectLocationJobJobMetadataSdkVersionBugs"
        end
      end

      class ProjectLocationJobJobMetadataSdkVersionBugsArray
        def self.parse(value, parent_identifier)
          return if value.nil?
          return ProjectLocationJobJobMetadataSdkVersionBugs.new(value, parent_identifier) unless value.is_a?(::Array)
          value.map { |v| ProjectLocationJobJobMetadataSdkVersionBugs.new(v, parent_identifier) }
        end
      end
    end
  end
end
