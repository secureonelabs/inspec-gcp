---
title: About the google_compute_global_network_endpoint_groups resource
platform: gcp
---

## Syntax
A `google_compute_global_network_endpoint_groups` is used to test a Google GlobalNetworkEndpointGroup resource

## Examples
```

describe google_compute_global_network_endpoint_groups(project: 'chef-gcp-inspec') do
  its('default_ports') { should include '90' }
  its('names') { should include 'inspec-gcp-global-endpoint-group' }
  its('network_endpoint_types'){ should include 'INTERNET_IP_PORT' }
end

```

## Properties
Properties that can be accessed from the `google_compute_global_network_endpoint_groups` resource:

See [google_compute_global_network_endpoint_group.md](google_compute_global_network_endpoint_group.md) for more detailed information
  * `ids`: an array of `google_compute_global_network_endpoint_group` id
  * `names`: an array of `google_compute_global_network_endpoint_group` name
  * `descriptions`: an array of `google_compute_global_network_endpoint_group` description
  * `network_endpoint_types`: an array of `google_compute_global_network_endpoint_group` network_endpoint_type
  * `default_ports`: an array of `google_compute_global_network_endpoint_group` default_port

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
