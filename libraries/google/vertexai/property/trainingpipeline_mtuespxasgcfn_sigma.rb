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
require 'google/vertexai/property/trainingpipeline_mtuespxasgcfnsn_sigma'
module GoogleInSpec
  module VertexAI
    module Property
      class TrainingPipelineModelToUploadExplanationSpecParametersXraiAttributionSmoothGradConfigFeatureNoiseSigma
        attr_reader :noise_sigma

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @noise_sigma = GoogleInSpec::VertexAI::Property::TrainingPipelineModelToUploadExplanationSpecParametersXraiAttributionSmoothGradConfigFeatureNoiseSigmaNoiseSigmaArray.parse(args['noiseSigma'], to_s)
        end

        def to_s
          "#{@parent_identifier} TrainingPipelineModelToUploadExplanationSpecParametersXraiAttributionSmoothGradConfigFeatureNoiseSigma"
        end
      end
    end
  end
end
