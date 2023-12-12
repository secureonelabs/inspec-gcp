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
require 'gcp_backend'
class ComputeServiceAttachments < GcpResourceBase
  name 'google_compute_service_attachments'
  desc 'ServiceAttachment plural resource'
  supports platform: 'gcp'

  attr_reader :table

  filter_table_config = FilterTable.create

  filter_table_config.add(:kinds, field: :kind)
  filter_table_config.add(:ids, field: :id)
  filter_table_config.add(:creation_timestamps, field: :creation_timestamp)
  filter_table_config.add(:names, field: :name)
  filter_table_config.add(:descriptions, field: :description)
  filter_table_config.add(:self_links, field: :self_link)
  filter_table_config.add(:regions, field: :region)
  filter_table_config.add(:producer_forwarding_rules, field: :producer_forwarding_rule)
  filter_table_config.add(:target_services, field: :target_service)
  filter_table_config.add(:connection_preferences, field: :connection_preference)
  filter_table_config.add(:connected_endpoints, field: :connected_endpoints)
  filter_table_config.add(:nat_subnets, field: :nat_subnets)
  filter_table_config.add(:enable_proxy_protocols, field: :enable_proxy_protocol)
  filter_table_config.add(:consumer_reject_lists, field: :consumer_reject_lists)
  filter_table_config.add(:consumer_accept_lists, field: :consumer_accept_lists)
  filter_table_config.add(:psc_service_attachment_ids, field: :psc_service_attachment_id)
  filter_table_config.add(:fingerprints, field: :fingerprint)
  filter_table_config.add(:domain_names, field: :domain_names)
  filter_table_config.add(:reconcile_connections, field: :reconcile_connections)

  filter_table_config.connect(self, :table)

  def initialize(params = {})
    super(params.merge({ use_http_transport: true }))
    @params = params
    @table = fetch_wrapped_resource('items')
  end

  def fetch_wrapped_resource(wrap_path)
    # fetch_resource returns an array of responses (to handle pagination)
    result = @connection.fetch_all(product_url, resource_base_url, @params, 'Get')
    return if result.nil?

    # Conversion of string -> object hash to symbol -> object hash that InSpec needs
    converted = []
    result.each do |response|
      next if response.nil? || !response.key?(wrap_path)
      response[wrap_path].each do |hash|
        hash_with_symbols = {}
        hash.each_key do |key|
          name, value = transform(key, hash)
          hash_with_symbols[name] = value
        end
        converted.push(hash_with_symbols)
      end
    end

    converted
  end

  def transform(key, value)
    return transformers[key].call(value) if transformers.key?(key)

    [key.to_sym, value]
  end

  def transformers
    {
      'kind' => ->(obj) { return :kind, obj['kind'] },
      'id' => ->(obj) { return :id, obj['id'] },
      'creationTimestamp' => ->(obj) { return :creation_timestamp, obj['creationTimestamp'] },
      'name' => ->(obj) { return :name, obj['name'] },
      'description' => ->(obj) { return :description, obj['description'] },
      'selfLink' => ->(obj) { return :self_link, obj['selfLink'] },
      'region' => ->(obj) { return :region, obj['region'] },
      'producerForwardingRule' => ->(obj) { return :producer_forwarding_rule, obj['producerForwardingRule'] },
      'targetService' => ->(obj) { return :target_service, obj['targetService'] },
      'connectionPreference' => ->(obj) { return :connection_preference, obj['connectionPreference'] },
      'connectedEndpoints' => ->(obj) { return :connected_endpoints, GoogleInSpec::Compute::Property::ServiceAttachmentConnectedEndpointsArray.parse(obj['connectedEndpoints'], to_s) },
      'natSubnets' => ->(obj) { return :nat_subnets, obj['natSubnets'] },
      'enableProxyProtocol' => ->(obj) { return :enable_proxy_protocol, obj['enableProxyProtocol'] },
      'consumerRejectLists' => ->(obj) { return :consumer_reject_lists, obj['consumerRejectLists'] },
      'consumerAcceptLists' => ->(obj) { return :consumer_accept_lists, GoogleInSpec::Compute::Property::ServiceAttachmentConsumerAcceptListsArray.parse(obj['consumerAcceptLists'], to_s) },
      'pscServiceAttachmentId' => ->(obj) { return :psc_service_attachment_id, GoogleInSpec::Compute::Property::ServiceAttachmentPscServiceAttachmentId.new(obj['pscServiceAttachmentId'], to_s) },
      'fingerprint' => ->(obj) { return :fingerprint, obj['fingerprint'] },
      'domainNames' => ->(obj) { return :domain_names, obj['domainNames'] },
      'reconcileConnections' => ->(obj) { return :reconcile_connections, obj['reconcileConnections'] },
    }
  end

  private

  def product_url(_ = nil)
    'https://compute.googleapis.com/compute/v1/'
  end

  def resource_base_url
    'projects/{{project}}/regions/{{region}}/serviceAttachments'
  end
end
