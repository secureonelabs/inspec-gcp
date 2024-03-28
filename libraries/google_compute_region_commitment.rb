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
require 'google/compute/property/regioncommitment_license_resource'
require 'google/compute/property/regioncommitment_reservations'
require 'google/compute/property/regioncommitment_resource_status'
require 'google/compute/property/regioncommitment_resource_status_cancellation_information'
require 'google/compute/property/regioncommitment_resource_status_cancellation_information_canceled_commitment'
require 'google/compute/property/regioncommitment_resource_status_cancellation_information_cancellation_cap'
require 'google/compute/property/regioncommitment_resource_status_cancellation_information_cancellation_fee'
require 'google/compute/property/regioncommitment_resources'

# A provider to manage Compute Engine resources.
class ComputeRegionCommitment < GcpResourceBase
  name 'google_compute_region_commitment'
  desc 'RegionCommitment'
  supports platform: 'gcp'

  attr_reader :params
  attr_reader :kind
  attr_reader :id
  attr_reader :creation_timestamp
  attr_reader :name
  attr_reader :description
  attr_reader :region
  attr_reader :self_link
  attr_reader :self_link_with_id
  attr_reader :status
  attr_reader :status_message
  attr_reader :plan
  attr_reader :start_timestamp
  attr_reader :end_timestamp
  attr_reader :resources
  attr_reader :type
  attr_reader :reservations
  attr_reader :category
  attr_reader :license_resource
  attr_reader :auto_renew
  attr_reader :merge_source_commitments
  attr_reader :split_source_commitment
  attr_reader :resource_status
  attr_reader :existing_reservations

  def initialize(params)
    super(params.merge({ use_http_transport: true }))
    @params = params
    @fetched = @connection.fetch(product_url(params[:beta]), resource_base_url, params, 'Get')
    parse unless @fetched.nil?
  end

  def parse
    @kind = @fetched['kind']
    @id = @fetched['id']
    @creation_timestamp = @fetched['creationTimestamp']
    @name = @fetched['name']
    @description = @fetched['description']
    @region = @fetched['region']
    @self_link = @fetched['selfLink']
    @self_link_with_id = @fetched['selfLinkWithId']
    @status = @fetched['status']
    @status_message = @fetched['statusMessage']
    @plan = @fetched['plan']
    @start_timestamp = @fetched['startTimestamp']
    @end_timestamp = @fetched['endTimestamp']
    @resources = GoogleInSpec::Compute::Property::RegionCommitmentResourcesArray.parse(@fetched['resources'], to_s)
    @type = @fetched['type']
    @reservations = GoogleInSpec::Compute::Property::RegionCommitmentReservationsArray.parse(@fetched['reservations'], to_s)
    @category = @fetched['category']
    @license_resource = GoogleInSpec::Compute::Property::RegionCommitmentLicenseResource.new(@fetched['licenseResource'], to_s)
    @auto_renew = @fetched['autoRenew']
    @merge_source_commitments = @fetched['mergeSourceCommitments']
    @split_source_commitment = @fetched['splitSourceCommitment']
    @resource_status = GoogleInSpec::Compute::Property::RegionCommitmentResourceStatus.new(@fetched['resourceStatus'], to_s)
    @existing_reservations = @fetched['existingReservations']
  end

  def exists?
    !@fetched.nil?
  end

  def to_s
    "RegionCommitment #{@params[:commitment]}"
  end

  private

  def product_url(_ = nil)
    'https://compute.googleapis.com/compute/v1/'
  end

  def resource_base_url
    'projects/{{project}}/regions/{{region}}/commitments/{{commitment}}'
  end
end
