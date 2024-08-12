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
require 'google/run/property/service_template_containers_env_value_source'
require 'google/run/property/service_template_containers_env_value_source_secret_key_ref'
module GoogleInSpec
  module Run
    module Property
      class ServiceTemplateContainersEnv
        attr_reader :name

        attr_reader :value

        attr_reader :value_source

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @name = args['name']
          @value = args['value']
          @value_source = GoogleInSpec::Run::Property::ServiceTemplateContainersEnvValueSource.new(args['valueSource'], to_s)
        end

        def to_s
          "#{@parent_identifier} ServiceTemplateContainersEnv"
        end
      end

      class ServiceTemplateContainersEnvArray
        def self.parse(value, parent_identifier)
          return if value.nil?
          return ServiceTemplateContainersEnv.new(value, parent_identifier) unless value.is_a?(::Array)
          value.map { |v| ServiceTemplateContainersEnv.new(v, parent_identifier) }
        end
      end
    end
  end
end
