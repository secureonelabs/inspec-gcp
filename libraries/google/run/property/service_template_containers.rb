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
require 'google/run/property/service_template_containers_env'
require 'google/run/property/service_template_containers_liveness_probe'
require 'google/run/property/service_template_containers_liveness_probe_grpc'
require 'google/run/property/service_template_containers_liveness_probe_http_get'
require 'google/run/property/service_template_containers_liveness_probe_http_get_http_headers'
require 'google/run/property/service_template_containers_liveness_probe_tcp_socket'
require 'google/run/property/service_template_containers_ports'
require 'google/run/property/service_template_containers_resources'
require 'google/run/property/service_template_containers_resources_limits'
require 'google/run/property/service_template_containers_startup_probe'
require 'google/run/property/service_template_containers_startup_probe_grpc'
require 'google/run/property/service_template_containers_startup_probe_http_get'
require 'google/run/property/service_template_containers_startup_probe_http_get_http_headers'
require 'google/run/property/service_template_containers_startup_probe_tcp_socket'
require 'google/run/property/service_template_containers_volume_mounts'
module GoogleInSpec
  module Run
    module Property
      class ServiceTemplateContainers
        attr_reader :name

        attr_reader :image

        attr_reader :command

        attr_reader :args

        attr_reader :env

        attr_reader :resources

        attr_reader :ports

        attr_reader :volume_mounts

        attr_reader :working_dir

        attr_reader :liveness_probe

        attr_reader :startup_probe

        attr_reader :depends_on

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @name = args['name']
          @image = args['image']
          @command = args['command']
          @args = args['args']
          @env = GoogleInSpec::Run::Property::ServiceTemplateContainersEnvArray.parse(args['env'], to_s)
          @resources = GoogleInSpec::Run::Property::ServiceTemplateContainersResources.new(args['resources'], to_s)
          @ports = GoogleInSpec::Run::Property::ServiceTemplateContainersPortsArray.parse(args['ports'], to_s)
          @volume_mounts = GoogleInSpec::Run::Property::ServiceTemplateContainersVolumeMountsArray.parse(args['volumeMounts'], to_s)
          @working_dir = args['workingDir']
          @liveness_probe = GoogleInSpec::Run::Property::ServiceTemplateContainersLivenessProbe.new(args['livenessProbe'], to_s)
          @startup_probe = GoogleInSpec::Run::Property::ServiceTemplateContainersStartupProbe.new(args['startupProbe'], to_s)
          @depends_on = args['dependsOn']
        end

        def to_s
          "#{@parent_identifier} ServiceTemplateContainers"
        end
      end

      class ServiceTemplateContainersArray
        def self.parse(value, parent_identifier)
          return if value.nil?
          return ServiceTemplateContainers.new(value, parent_identifier) unless value.is_a?(::Array)
          value.map { |v| ServiceTemplateContainers.new(v, parent_identifier) }
        end
      end
    end
  end
end
