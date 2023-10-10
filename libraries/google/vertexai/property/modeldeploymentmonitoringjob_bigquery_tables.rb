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
  module VertexAI
    module Property
      class ModelDeploymentMonitoringJobBigqueryTables
        attr_reader :log_source

        attr_reader :bigquery_table_path

        attr_reader :log_type

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @log_source = args['logSource']
          @bigquery_table_path = args['bigqueryTablePath']
          @log_type = args['logType']
        end

        def to_s
          "#{@parent_identifier} ModelDeploymentMonitoringJobBigqueryTables"
        end
      end

      class ModelDeploymentMonitoringJobBigqueryTablesArray
        def self.parse(value, parent_identifier)
          return if value.nil?
          return ModelDeploymentMonitoringJobBigqueryTables.new(value, parent_identifier) unless value.is_a?(::Array)
          value.map { |v| ModelDeploymentMonitoringJobBigqueryTables.new(v, parent_identifier) }
        end
      end
    end
  end
end
