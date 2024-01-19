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
      class BatchPredictionJobOutputInfo
        attr_reader :bigquery_output_dataset

        attr_reader :gcs_output_directory

        attr_reader :bigquery_output_table

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @bigquery_output_dataset = args['bigqueryOutputDataset']
          @gcs_output_directory = args['gcsOutputDirectory']
          @bigquery_output_table = args['bigqueryOutputTable']
        end

        def to_s
          "#{@parent_identifier} BatchPredictionJobOutputInfo"
        end
      end
    end
  end
end
