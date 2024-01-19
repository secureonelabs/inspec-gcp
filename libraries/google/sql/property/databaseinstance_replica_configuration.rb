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
require 'google/sql/property/databaseinstance_replica_configuration_mysql_replica_configuration'
module GoogleInSpec
  module SQL
    module Property
      class DatabaseInstanceReplicaConfiguration
        attr_reader :failover_target

        attr_reader :mysql_replica_configuration

        attr_reader :replica_names

        attr_reader :service_account_email_address

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @failover_target = args['failoverTarget']
          @mysql_replica_configuration = GoogleInSpec::SQL::Property::DatabaseInstanceReplicaConfigurationMysqlReplicaConfiguration.new(args['mysqlReplicaConfiguration'], to_s)
          @replica_names = args['replicaNames']
          @service_account_email_address = args['serviceAccountEmailAddress']
        end

        def to_s
          "#{@parent_identifier} DatabaseInstanceReplicaConfiguration"
        end
      end
    end
  end
end
