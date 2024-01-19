# frozen_string_literal: false

# ----------------------------------------------------------------------------
#
#     ***     AUTO GENERATED CODE    ***    AUTO GENERATED CODE     ***
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
class ComputeNetworkEndpointGroups < GcpResourceBase
  name 'google_compute_network_endpoint_groups'
  desc 'NetworkEndpointGroup plural resource'
  supports platform: 'gcp'

  attr_reader :table

  filter_table_config = FilterTable.create

  filter_table_config.add(:ids, field: :id)
  filter_table_config.add(:names, field: :name)
  filter_table_config.add(:descriptions, field: :description)
  filter_table_config.add(:network_endpoint_types, field: :network_endpoint_type)
  filter_table_config.add(:sizes, field: :size)
  filter_table_config.add(:networks, field: :network)
  filter_table_config.add(:subnetworks, field: :subnetwork)
  filter_table_config.add(:default_ports, field: :default_port)
  filter_table_config.add(:zones, field: :zone)

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
      'id' => ->(obj) { [:id, obj['id']] },
      'name' => ->(obj) { [:name, obj['name']] },
      'description' => ->(obj) { [:description, obj['description']] },
      'networkEndpointType' => ->(obj) { [:network_endpoint_type, obj['networkEndpointType']] },
      'size' => ->(obj) { [:size, obj['size']] },
      'network' => ->(obj) { [:network, obj['network']] },
      'subnetwork' => ->(obj) { [:subnetwork, obj['subnetwork']] },
      'defaultPort' => ->(obj) { [:default_port, obj['defaultPort']] },
      'zone' => ->(obj) { [:zone, obj['zone']] },
    }
  end

  private

  def product_url(beta = false)
    if beta
      'https://compute.googleapis.com/compute/beta/'
    else
      'https://compute.googleapis.com/compute/v1/'
    end
  end

  def resource_base_url
    'projects/{{project}}/zones/{{zone}}/networkEndpointGroups'
  end
end
