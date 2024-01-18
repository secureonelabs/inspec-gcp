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
require 'google/vertexai/property/modelsevaluation_explanation_specs_explanation_spec_metadata'
require 'google/vertexai/property/modelsevaluation_explanation_specs_explanation_spec_metadata_inputs'
require 'google/vertexai/property/modelsevaluation_explanation_specs_explanation_spec_metadata_outputs'
require 'google/vertexai/property/modelsevaluation_explanation_specs_explanation_spec_parameters'
require 'google/vertexai/property/modelsevaluation_explanation_specs_explanation_spec_parameters_examples'
require 'google/vertexai/property/modelsevaluation_explanation_specs_explanation_spec_parameters_examples_example_gcs_source'
require 'google/vertexai/property/modelsevaluation_esespeegsg_source'
require 'google/vertexai/property/modelsevaluation_explanation_specs_explanation_spec_parameters_examples_presets'
require 'google/vertexai/property/modelsevaluation_explanation_specs_explanation_spec_parameters_integrated_gradients_attribution'
require 'google/vertexai/property/modelsevaluation_esespigabb_config'
require 'google/vertexai/property/modelsevaluation_esespigasg_config'
require 'google/vertexai/property/modelsevaluation_esespigasgcfn_sigma'
require 'google/vertexai/property/modelsevaluation_esespigasgcfnsn_sigma'
require 'google/vertexai/property/modelsevaluation_explanation_specs_explanation_spec_parameters_sampled_shapley_attribution'
require 'google/vertexai/property/modelsevaluation_explanation_specs_explanation_spec_parameters_xrai_attribution'
require 'google/vertexai/property/modelsevaluation_esespxabb_config'
require 'google/vertexai/property/modelsevaluation_esespxasg_config'
require 'google/vertexai/property/modelsevaluation_esespxasgcfn_sigma'
require 'google/vertexai/property/modelsevaluation_esespxasgcfnsn_sigma'
module GoogleInSpec
  module VertexAI
    module Property
      class ModelsEvaluationExplanationSpecsExplanationSpec
        attr_reader :parameters

        attr_reader :metadata

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @parameters = GoogleInSpec::VertexAI::Property::ModelsEvaluationExplanationSpecsExplanationSpecParameters.new(args['parameters'], to_s)
          @metadata = GoogleInSpec::VertexAI::Property::ModelsEvaluationExplanationSpecsExplanationSpecMetadata.new(args['metadata'], to_s)
        end

        def to_s
          "#{@parent_identifier} ModelsEvaluationExplanationSpecsExplanationSpec"
        end
      end
    end
  end
end
