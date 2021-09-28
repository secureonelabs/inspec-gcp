
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
require 'google/compute/property/zone_deprecated'

# A provider to manage Compute Engine resources.
class ComputeAcceleratorType < GcpResourceBase
  name 'google_compute_accelerator_type'
  desc 'Accelerator Type'
  supports platform: 'gcp'

  attr_reader :params
  attr_reader :creation_timestamp
  attr_reader :deprecated
  attr_reader :description
  attr_reader :id
  attr_reader :name
  attr_reader :zone
  attr_reader :selfLink
  attr_reader :availableCpuPlatforms

  def initialize(params)
    super(params.merge({ use_http_transport: true }))
    @params = params
    @fetched = @connection.fetch(product_url(params[:beta]), resource_base_url, params, 'Get')
    parse unless @fetched.nil?
  end

  def parse
    @creation_timestamp = parse_time_string(@fetched['creationTimestamp'])
    @deprecated = GoogleInSpec::Compute::Property::ZoneDeprecated.new(@fetched['deprecated'], to_s)
    @description = @fetched['description']
    @id = @fetched['id']
    @name = @fetched['name']
    @zone = @fetched['zone']
    @selfLink = @fetched['selfLink']
    @availableCpuPlatforms = @fetched['availableCpuPlatforms']
  end

  # Handles parsing RFC3339 time string
  def parse_time_string(time_string)
    time_string ? Time.parse(time_string) : nil
  end

  def exists?
    !@fetched.nil?
  end

  def to_s
    "AcceleratorType #{@params[:name]}"
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
    'projects/{{project}}/zones/{{zone}}/acceleratorTypes/{{accelerator_id}}'
  end
end
