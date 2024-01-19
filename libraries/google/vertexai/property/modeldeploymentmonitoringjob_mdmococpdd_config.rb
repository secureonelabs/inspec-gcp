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
require 'google/vertexai/property/modeldeploymentmonitoringjob_mdmococpddcasd_thresholds'
require 'google/vertexai/property/modeldeploymentmonitoringjob_mdmococpddcdd_threshold'
require 'google/vertexai/property/modeldeploymentmonitoringjob_mdmococpddcd_thresholds'
module GoogleInSpec
  module VertexAI
    module Property
      class ModelDeploymentMonitoringJobModelDeploymentMonitoringObjectiveConfigsObjectiveConfigPredictionDriftDetectionConfig
        attr_reader :attribution_score_drift_thresholds

        attr_reader :drift_thresholds

        attr_reader :default_drift_threshold

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @attribution_score_drift_thresholds = GoogleInSpec::VertexAI::Property::ModelDeploymentMonitoringJobModelDeploymentMonitoringObjectiveConfigsObjectiveConfigPredictionDriftDetectionConfigAttributionScoreDriftThresholds.new(args['attributionScoreDriftThresholds'], to_s)
          @drift_thresholds = GoogleInSpec::VertexAI::Property::ModelDeploymentMonitoringJobModelDeploymentMonitoringObjectiveConfigsObjectiveConfigPredictionDriftDetectionConfigDriftThresholds.new(args['driftThresholds'], to_s)
          @default_drift_threshold = GoogleInSpec::VertexAI::Property::ModelDeploymentMonitoringJobModelDeploymentMonitoringObjectiveConfigsObjectiveConfigPredictionDriftDetectionConfigDefaultDriftThreshold.new(args['defaultDriftThreshold'], to_s)
        end

        def to_s
          "#{@parent_identifier} ModelDeploymentMonitoringJobModelDeploymentMonitoringObjectiveConfigsObjectiveConfigPredictionDriftDetectionConfig"
        end
      end
    end
  end
end
