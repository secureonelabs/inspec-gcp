variable "ssl_policy" {
  type = any
}

variable "topic" {
  type = any
}

variable "subscription" {
  type = any
}

variable "managed_zone" {
	type = any
}

variable "record_set" {
	type = any
}

variable "instance_group_manager" {
  type = any
}

variable "autoscaler" {
  type = any
}

variable "target_pool" {
  type = any
}

variable "trigger" {
  type = any
}

variable "health_check" {
  type = any
}

variable "backend_service" {
  type = any
}

variable "http_health_check" {
  type = any
}

variable "https_health_check" {
  type = any
}

variable "instance_template" {
  type = any
}

variable "global_address" {
  type = any
}

variable "url_map" {
  type = any
}

variable "http_proxy" {
  type = any
}

variable "global_forwarding_rule" {
  type = any
}

variable "target_tcp_proxy" {
  type = any
}

variable "route" {
  type = any
}

variable "router" {
  type = any
}

variable "snapshot" {
  type = any
}

variable "https_proxy" {
  type = any
}

variable "ssl_certificate" {
  type = any
}

variable "dataset" {
  type = any
}

variable "bigquery_table" {
  type = any
}

variable "repository" {
  type = any
}

variable "folder" {
  type = any
}

variable "gcp_organization_id" {
  type = string
  default = "none"
}

variable "cloudfunction" {
  type = any
}

variable "backend_bucket" {
  type = any
}

variable "gcp_cloud_function_region" {}

variable "regional_node_pool" {
  type = any
}

variable "region_backend_service_health_check" {
  type = any
}

variable "region_health_check" {
  type = any
}

variable "region_backend_service" {
  type = any
}

variable "org_sink" {
  type = any
}

variable "standardappversion" {
  type = any
}

variable "ml_model" {
  type = any
}

variable "dataproc_cluster" {
  type = any
}

variable "folder_exclusion" {
  type = any
}

variable "filestore_instance" {
  type = any
}

variable "folder_sink" {
  type = any
}

variable "runtimeconfig_config" {
  type = any
}

variable "runtimeconfig_variable" {
  type = any
}

variable "redis" {
  type = any
}

variable "network_endpoint_group" {
  type = any
}
variable "global_network_endpoint_group" {
  type = any
}

variable "node_template" {
  type = any
}

variable "node_group" {
  type = any
}

variable "router_nat" {
  type = any
}

variable "service" {
  type = any
}

variable "spannerinstance" {
  type = any
}

variable "spannerdatabase" {
  type = any
}

variable "scheduler_job" {
  type = any
}

variable "project_location_repository" {
  type = any
}

variable "cloud_composer_v1" {
  type = any
}

variable "compute_service_attachment_conf" {
  type = any
}


variable "apigee_organization_envgroup_attachment" {
  type = any
}

variable "organization_envgroup" {
  type = any
}
variable "vpn_gateway" {
  type = any
}
variable "region_network_endpoint_group" {
  type = any
}
variable "secrets_manager_v1" {
  type = any
}
variable "compute_machine_images" {
  type = any
}
variable "network_attachments" {
  type = any
}
variable "compute_target_vpn_gateway" {
  type = any
}
variable "bigtable_instance_cluster" {
  type = any
}
variable "dataproc_metastore_service" {
  type = any
}
variable "dataproc_metastore_federation" {
  type = any
}
variable "data_fusion_instance" {
  type = any
}
variable "cloud_run_jobs" {
  type = any
}
variable "dataproc_serverless_batches" {
  type = any
}
variable "monitoring_group" {
  type = any
}
resource "google_compute_ssl_policy" "custom-ssl-policy" {
  name            = var.ssl_policy["name"]
  min_tls_version = var.ssl_policy["min_tls_version"]
  profile         = var.ssl_policy["profile"]
  custom_features = [var.ssl_policy["custom_feature"], var.ssl_policy["custom_feature2"]]
  project         = var.gcp_project_id
}

resource "google_pubsub_topic" "topic" {
  project = var.gcp_project_id
  name    = var.topic["name"]
}

resource "google_pubsub_subscription" "default" {
  project              = var.gcp_project_id
  name                 = var.subscription["name"]
  topic                = google_pubsub_topic.topic.name
  ack_deadline_seconds = var.subscription["ack_deadline_seconds"]
}

resource "google_dns_managed_zone" "prod" {
  name        = var.managed_zone["name"]
  dns_name    = var.managed_zone["dns_name"]
  description = var.managed_zone["description"]

  labels = {
    key = var.managed_zone["label_value"]
  }
  project = var.gcp_project_id
}

resource "google_dns_record_set" "a" {
  name = var.record_set["name"]
  managed_zone = google_dns_managed_zone.prod.name
  type = var.record_set["type"]
  ttl  = var.record_set["ttl"]

  rrdatas = [var.record_set["rrdatas1"], var.record_set["rrdatas2"]]
  project = var.gcp_project_id
}

resource "google_compute_instance_group_manager" "gcp-inspec-igm" {
  project           = var.gcp_project_id
  zone              = var.gcp_zone
  name              = var.instance_group_manager["name"]
  version {
    instance_template = google_compute_instance_template.default.self_link
  }
  base_instance_name        = var.instance_group_manager["base_instance_name"]
  target_pools = []
  target_size  = 0
  named_port {
    name = var.instance_group_manager["named_port_name"]
    port = var.instance_group_manager["named_port_port"]
  }
}

resource "google_compute_autoscaler" "gcp-inspec-autoscaler" {
  project = var.gcp_project_id
  name    = var.autoscaler["name"]
  zone    = var.gcp_zone
  target  = google_compute_instance_group_manager.gcp-inspec-igm.self_link

  autoscaling_policy {
    max_replicas    = var.autoscaler["max_replicas"]
    min_replicas    = var.autoscaler["min_replicas"]
    cooldown_period = var.autoscaler["cooldown_period"]

    cpu_utilization {
      target = var.autoscaler["cpu_utilization_target"]
    }
  }
}

resource "google_compute_target_pool" "gcp-inspec-target-pool" {
  project = var.gcp_project_id
  name = var.target_pool["name"]
  session_affinity = var.target_pool["session_affinity"]

  instances = [
    "${var.gcp_zone}/${var.gcp_ext_vm_name}",
  ]
}

resource "google_cloudbuild_trigger" "gcp-inspec-cloudbuild-trigger" {
  project = var.gcp_project_id
  trigger_template {
    branch_name = var.trigger["trigger_template_branch"]
    project_id  = var.trigger["trigger_template_project"]
    repo_name   = var.trigger["trigger_template_repo"]
  }
  filename = var.trigger["filename"]
}

resource "google_compute_health_check" "gcp-inspec-health-check" {
 project = var.gcp_project_id
 name = var.health_check["name"]

 timeout_sec = var.health_check["timeout_sec"]
 check_interval_sec = var.health_check["check_interval_sec"]

 tcp_health_check {
   port = var.health_check["tcp_health_check_port"]
 }
}

resource "google_compute_region_health_check" "tcp-region-health-check" {
  project = var.gcp_project_id
  name     = var.region_health_check["name"]
  region   = var.region_health_check["region"]
  timeout_sec        = 1
  check_interval_sec = 1

  tcp_health_check {
    port = "80"
  }
}

resource "google_compute_backend_service" "gcp-inspec-backend-service" {
  project     = var.gcp_project_id
  name        = var.backend_service["name"]
  description = var.backend_service["description"]
  port_name   = var.backend_service["port_name"]
  protocol    = var.backend_service["protocol"]
  timeout_sec = var.backend_service["timeout_sec"]
  enable_cdn  = var.backend_service["enable_cdn"]

  backend {
    group = google_compute_instance_group_manager.gcp-inspec-igm.instance_group
  }

  health_checks = [google_compute_health_check.gcp-inspec-health-check.self_link]
}

resource "google_compute_health_check" "gcp-inspec-region-backend-service-hc" {
 project = var.gcp_project_id
 name = var.region_backend_service_health_check["name"]

 timeout_sec = var.region_backend_service_health_check["timeout_sec"]
 check_interval_sec = var.region_backend_service_health_check["check_interval_sec"]

 tcp_health_check {
   port = var.region_backend_service_health_check["tcp_health_check_port"]
 }
}

resource "google_compute_region_backend_service" "gcp-inspec-region-backend-service" {
  project     = var.gcp_project_id
  region      = var.gcp_location
  name        = var.region_backend_service["name"]
  description = var.region_backend_service["description"]
  protocol    = var.region_backend_service["protocol"]
  timeout_sec = var.region_backend_service["timeout_sec"]

  health_checks = [google_compute_health_check.gcp-inspec-region-backend-service-hc.self_link]
}

resource "google_compute_http_health_check" "gcp-inspec-http-health-check" {
  project      = var.gcp_project_id
  name         = var.http_health_check["name"]
  request_path = var.http_health_check["request_path"]

  timeout_sec        = var.http_health_check["timeout_sec"]
  check_interval_sec = var.http_health_check["check_interval_sec"]
}

resource "google_compute_https_health_check" "gcp-inspec-https-health-check" {
  project      = var.gcp_project_id
  name         = var.https_health_check["name"]
  request_path = var.https_health_check["request_path"]

  timeout_sec         = var.https_health_check["timeout_sec"]
  check_interval_sec  = var.https_health_check["check_interval_sec"]
  unhealthy_threshold = var.https_health_check["unhealthy_threshold"]
}

resource "google_compute_instance_template" "gcp-inspec-instance-template" {
  project     = var.gcp_project_id
  name        = var.instance_template["name"]
  description = var.instance_template["description"]

  tags = [var.instance_template["tag"]]

  instance_description = var.instance_template["instance_description"]
  machine_type         = var.instance_template["machine_type"]
  can_ip_forward       = var.instance_template["can_ip_forward"]

  scheduling {
    automatic_restart   = var.instance_template["scheduling_automatic_restart"]
    on_host_maintenance = var.instance_template["scheduling_on_host_maintenance"]
  }

  // Create a new boot disk from an image
  disk {
    source_image = var.instance_template["disk_source_image"]
    auto_delete  = var.instance_template["disk_auto_delete"]
    boot         = var.instance_template["disk_boot"]
  }

  network_interface {
    network = var.instance_template["network_interface_network"]
  }

  service_account {
    scopes = [var.instance_template["service_account_scope"]]
  }
}

resource "google_compute_global_address" "gcp-inspec-global-address" {
  project = var.gcp_project_id
  name = var.global_address["name"]
  ip_version = var.global_address["ip_version"]
}

resource "google_compute_url_map" "gcp-inspec-url-map" {
  project     = var.gcp_project_id
  name        = var.url_map["name"]
  description = var.url_map["description"]

  default_service = google_compute_backend_service.gcp-inspec-backend-service.self_link

  host_rule {
    hosts        = [var.url_map["host_rule_host"]]
    path_matcher = var.url_map["path_matcher_name"]
  }

  path_matcher {
    name            = var.url_map["path_matcher_name"]
    default_service = google_compute_backend_service.gcp-inspec-backend-service.self_link

    path_rule {
      paths   = [var.url_map["path_rule_path"]]
      service = google_compute_backend_service.gcp-inspec-backend-service.self_link
    }
  }

  test {
    service = google_compute_backend_service.gcp-inspec-backend-service.self_link
    host    = var.url_map["test_host"]
    path    = var.url_map["test_path"]
  }
}

resource "google_compute_target_http_proxy" "gcp-inspec-http-proxy" {
  project     = var.gcp_project_id
  name        = var.http_proxy["name"]
  url_map     = google_compute_url_map.gcp-inspec-url-map.self_link
  description = var.http_proxy["description"]
}

resource "google_compute_global_forwarding_rule" "gcp-inspec-global-forwarding-rule" {
  project    = var.gcp_project_id
  name       = var.global_forwarding_rule["name"]
  target     = google_compute_target_http_proxy.gcp-inspec-http-proxy.self_link
  port_range = var.global_forwarding_rule["port_range"]
}

resource "google_compute_backend_service" "gcp-inspec-tcp-backend-service" {
  project       = var.gcp_project_id
  name          = var.target_tcp_proxy["tcp_backend_service_name"]
  protocol      = "TCP"
  timeout_sec   = 10

  health_checks = [google_compute_health_check.gcp-inspec-health-check.self_link]
}

resource "google_compute_target_tcp_proxy" "gcp-inspec-target-tcp-proxy" {
  project         = var.gcp_project_id
  name            = var.target_tcp_proxy["name"]
  proxy_header    = var.target_tcp_proxy["proxy_header"]
  backend_service = google_compute_backend_service.gcp-inspec-tcp-backend-service.self_link
}

resource "google_compute_route" "gcp-inspec-route" {
  project     = var.gcp_project_id
  name        = var.route["name"]
  dest_range  = var.route["dest_range"]
  network     = google_compute_network.inspec-gcp-network.name
  next_hop_ip = var.route["next_hop_ip"]
  priority    = var.route["priority"]
  # google_compute_route depends on next_hop_ip belonging to a subnetwork
  # of the named network in this block. Since inspec-gcp-network does not
  # automatically create subnetworks, we need to create a dependency so
  # the route is not created before the subnetwork
  depends_on  = [google_compute_subnetwork.inspec-gcp-subnetwork]
}

resource "google_compute_router" "gcp-inspec-router" {
  project = var.gcp_project_id
  name    = var.router["name"]
  network = google_compute_network.inspec-gcp-network.name
  bgp {
    asn               = var.router["bgp_asn"]
    advertise_mode    = var.router["bgp_advertise_mode"]
    advertised_groups = [var.router["bgp_advertised_group"]]
    advertised_ip_ranges {
      range = var.router["bgp_advertised_ip_range1"]
    }
    advertised_ip_ranges {
      range = var.router["bgp_advertised_ip_range2"]
    }
  }
}

resource "google_compute_disk" "snapshot-disk" {
  project = var.gcp_project_id
  name  = var.snapshot["disk_name"]
  type  = var.snapshot["disk_type"]
  zone  = var.gcp_zone
  image = var.snapshot["disk_image"]
  labels = {
    environment = "generic_compute_disk_label"
  }
}

resource "google_compute_snapshot" "gcp-inspec-snapshot" {
  project = var.gcp_project_id
  name = var.snapshot["name"]
  source_disk = google_compute_disk.snapshot-disk.name
  zone = var.gcp_zone
}

resource "google_compute_ssl_certificate" "gcp-inspec-ssl-certificate" {
  project     = var.gcp_project_id
  name        = var.ssl_certificate["name"]
  private_key = var.ssl_certificate["private_key"]
  certificate = var.ssl_certificate["certificate"]
  description = var.ssl_certificate["description"]
}

resource "google_compute_target_https_proxy" "gcp-inspec-https-proxy" {
  project     = var.gcp_project_id
  name        = var.https_proxy["name"]
  url_map     = google_compute_url_map.gcp-inspec-url-map.self_link
  description = var.https_proxy["description"]
  ssl_certificates = [google_compute_ssl_certificate.gcp-inspec-ssl-certificate.self_link]
}

resource "google_bigquery_dataset" "gcp-inspec-dataset" {
  project                     = var.gcp_project_id
  dataset_id                  = var.dataset["dataset_id"]
  friendly_name               = var.dataset["friendly_name"]
  description                 = var.dataset["description"]
  location                    = var.dataset["location"]
  default_table_expiration_ms = var.dataset["default_table_expiration_ms"]

  access {
    role          = var.dataset["access_writer_role"]
    special_group = var.dataset["access_writer_special_group"]
  }

  access {
    role          = "OWNER"
    special_group = "projectOwners"
  }
}

resource "google_bigquery_table" "gcp-inspec-bigquery-table" {
  project    = var.gcp_project_id
  dataset_id = google_bigquery_dataset.gcp-inspec-dataset.dataset_id
  table_id   = var.bigquery_table["table_id"]

  time_partitioning {
    type = var.bigquery_table["time_partitioning_type"]
  }

  description = var.bigquery_table["description"]
  expiration_time = var.bigquery_table["expiration_time"]
}

resource "google_sourcerepo_repository" "gcp-inspec-sourcerepo-repository" {
  project = var.gcp_project_id
  name = var.repository["name"]
}

resource "google_folder" "inspec-gcp-folder" {
  count = "${var.gcp_organization_id == "" ? 0 : var.gcp_enable_privileged_resources}"
  display_name = var.folder["display_name"]
  parent       = "organizations/${var.gcp_organization_id}"
}

resource "google_storage_bucket_object" "archive" {
  name   = "index.js.zip"
  bucket = google_storage_bucket.generic-storage-bucket.name
  source = "../configuration/index.js.zip"
}

resource "google_cloudfunctions_function" "function" {
  project               = var.gcp_project_id
  region                = var.gcp_cloud_function_region
  name                  = var.cloudfunction["name"]
  description           = var.cloudfunction["description"]
  available_memory_mb   = var.cloudfunction["available_memory_mb"]
  source_archive_bucket = google_storage_bucket.generic-storage-bucket.name
  source_archive_object = google_storage_bucket_object.archive.name
  trigger_http          = var.cloudfunction["trigger_http"]
  timeout               = var.cloudfunction["timeout"]
  entry_point           = var.cloudfunction["entry_point"]
  runtime               = "nodejs8"

  environment_variables = {
    MY_ENV_VAR = var.cloudfunction["env_var_value"]
  }
}

resource "google_compute_backend_bucket" "image_backend" {
  project     = var.gcp_project_id
  name        = var.backend_bucket["name"]
  description = var.backend_bucket["description"]
  bucket_name = google_storage_bucket.generic-storage-bucket.name
  enable_cdn  = var.backend_bucket["enable_cdn"]
}

resource "google_container_node_pool" "inspec-gcp-node-pool" {
  project    = var.gcp_project_id
  name       = var.regional_node_pool["name"]
  location   = google_container_cluster.primary.location
  cluster    = google_container_cluster.primary.name
  node_count = var.regional_node_pool["node_count"]
}

resource "google_logging_organization_sink" "my-sink" {
  count       = "${var.gcp_organization_id == "" ? 0 : var.gcp_enable_privileged_resources}"
  name        = var.org_sink.name
  org_id      = var.gcp_organization_id

  # Can export to pubsub, cloud storage, or bigquery
  destination = "storage.googleapis.com/${google_storage_bucket.generic-storage-bucket.name}"

  # Log all WARN or higher severity messages relating to instances
  filter      = var.org_sink.filter
}

variable "project_sink" {
  type = any
}

resource "google_logging_project_sink" "project-logging-sink" {
  count = "${var.gcp_organization_id == "" ? 0 : var.gcp_enable_privileged_resources}"
  project = var.gcp_project_id

  name = var.project_sink.name
  destination = "storage.googleapis.com/${google_storage_bucket.project-logging-bucket[0].name}"

  filter = var.project_sink.filter

  unique_writer_identity = true
}

resource "google_storage_bucket" "bucket" {
  name          = "inspec-gcp-static-${var.gcp_project_id}"
  project       = var.gcp_project_id
  location      = var.gcp_location
  force_destroy = true

  labels = {
    "key" = "value"
  }

  retention_policy {
    retention_period = 1000
  }
}

resource "google_storage_bucket_object" "object" {
  name   = "hello-world.zip"
  bucket = google_storage_bucket.bucket.name
  source = "../configuration/hello-world.zip"
}

resource "google_app_engine_standard_app_version" "default" {
  count = "${var.gcp_organization_id == "" ? 0 : var.gcp_enable_privileged_resources}"
  project         = var.gcp_project_id
  version_id      = var.standardappversion["version_id"]
  service         = var.standardappversion["service"]
  runtime         = var.standardappversion["runtime"]
  noop_on_destroy = true
  entrypoint {
    shell         = var.standardappversion["entrypoint"]
  }

  deployment {
    zip {
      source_url = "https://storage.googleapis.com/${google_storage_bucket.bucket.name}/hello-world.zip"
    }
  }

  env_variables = {
    port          = var.standardappversion["port"]
  }
}

resource "google_ml_engine_model" "inspec-gcp-model" {
  project                           = var.gcp_project_id
  name                              = var.ml_model["name"]
  description                       = var.ml_model["description"]
  regions                           = [var.ml_model["region"]]
  online_prediction_logging         = var.ml_model["online_prediction_logging"]
  online_prediction_console_logging = var.ml_model["online_prediction_console_logging"]
}

resource "google_compute_firewall" "dataproc" {
  project = var.gcp_project_id
  name    = "dataproc-firewall"
  network = google_compute_network.dataproc.name

  source_ranges = ["10.128.0.0/9"]
  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["0-65535"]
  }
  allow {
    protocol = "udp"
    ports    = ["0-65535"]
  }
}

resource "google_compute_network" "dataproc" {
  project = var.gcp_project_id
  name    = "dataproc-network"
}

resource "google_dataproc_cluster" "mycluster" {
  project = var.gcp_project_id
  region  = var.gcp_location
  name    = var.dataproc_cluster["name"]

  labels = {
    "${var.dataproc_cluster["label_key"]}" = var.dataproc_cluster["label_value"]
  }

  cluster_config {
    master_config {
      num_instances = var.dataproc_cluster["config"]["master_config"]["num_instances"]
      machine_type  = var.dataproc_cluster["config"]["master_config"]["machine_type"]
      disk_config {
        boot_disk_type    = var.dataproc_cluster["config"]["master_config"]["boot_disk_type"]
        boot_disk_size_gb = var.dataproc_cluster["config"]["master_config"]["boot_disk_size_gb"]
      }
    }

    worker_config {
      num_instances    = var.dataproc_cluster["config"]["worker_config"]["num_instances"]
      machine_type     = var.dataproc_cluster["config"]["worker_config"]["machine_type"]
      disk_config {
        boot_disk_size_gb = var.dataproc_cluster["config"]["worker_config"]["boot_disk_size_gb"]
        num_local_ssds    = var.dataproc_cluster["config"]["worker_config"]["num_local_ssds"]
      }
    }

    # Override or set some custom properties
    software_config {
      override_properties = {
        "${var.dataproc_cluster["config"]["software_config"]["prop_key"]}" = var.dataproc_cluster["config"]["software_config"]["prop_value"]
      }
    }

    gce_cluster_config {
      network = google_compute_network.dataproc.self_link
      tags    = [var.dataproc_cluster["config"]["gce_cluster_config"]["tag"]]
    }
  }
}

resource "google_logging_folder_exclusion" "my-exclusion" {
  count       = "${var.gcp_organization_id == "" ? 0 : var.gcp_enable_privileged_resources}"
  name        = var.folder_exclusion["name"]
  folder      = google_folder.inspec-gcp-folder.0.name

  description = var.folder_exclusion["description"]

  filter      = var.folder_exclusion["filter"]
}

variable "project_exclusion" {
  type = any
}

resource "google_logging_project_exclusion" "project-exclusion" {
  count       = "${var.gcp_organization_id == "" ? 0 : var.gcp_enable_privileged_resources}"
  name        = var.project_exclusion["name"]
  project     = var.gcp_project_id

  description = var.project_exclusion["description"]

  filter      = var.project_exclusion["filter"]
}

resource "google_filestore_instance" "instance" {
  project = var.gcp_project_id
  name    = var.filestore_instance["name"]
  zone    = var.filestore_instance["zone"]
  tier    = var.filestore_instance["tier"]

  file_shares {
    capacity_gb = var.filestore_instance["fileshare_capacity_gb"]
    name        = var.filestore_instance["fileshare_name"]
  }

  networks {
    network = var.filestore_instance["network_name"]
    modes   = [var.filestore_instance["network_mode"]]
  }
}

resource "google_logging_folder_sink" "folder-sink" {
  count       = "${var.gcp_organization_id == "" ? 0 : var.gcp_enable_privileged_resources}"
  name        = var.folder_sink.name
  folder      = google_folder.inspec-gcp-folder.0.name

  destination = "storage.googleapis.com/${google_storage_bucket.generic-storage-bucket.name}"

  filter      = var.folder_sink.filter
}

resource "google_runtimeconfig_config" "inspec-runtime-config" {
  project = var.gcp_project_id
  name = var.runtimeconfig_config["name"]
  description = var.runtimeconfig_config["description"]
}

resource "google_runtimeconfig_variable" "inspec-runtime-variable" {
  project = var.gcp_project_id
  parent = google_runtimeconfig_config.inspec-runtime-config.name
  name = var.runtimeconfig_variable["name"]
  text = var.runtimeconfig_variable["text"]
}

resource "google_redis_instance" "inspec-redis" {
  project        = var.gcp_project_id
  name           = var.redis["name"]
  tier           = var.redis["tier"]
  memory_size_gb = var.redis["memory_size_gb"]

  location_id             = var.redis["location_id"]
  alternative_location_id = var.redis["alternative_location_id"]

  redis_version     = var.redis["redis_version"]
  display_name      = var.redis["display_name"]
  reserved_ip_range = var.redis["reserved_ip_range"]

  labels = {
    "${var.redis["label_key"]}" = var.redis["label_value"]
  }
}

resource "google_compute_network_endpoint_group" "inspec-endpoint-group" {
  project      = var.gcp_project_id
  name         = var.network_endpoint_group["name"]
  network      = google_compute_subnetwork.inspec-gcp-subnetwork.network
  subnetwork   = google_compute_subnetwork.inspec-gcp-subnetwork.self_link
  default_port = var.network_endpoint_group["default_port"]
  zone         = var.gcp_zone
}

resource "google_compute_global_network_endpoint_group" "inspec-global-endpoint-group" {
  project      = var.gcp_project_id
  name         = var.global_network_endpoint_group["name"]
  default_port = var.global_network_endpoint_group["default_port"]
  network_endpoint_type = var.global_network_endpoint_group["network_endpoint_type"]
}

data "google_compute_node_types" "zone-node-type" {
  project = var.gcp_project_id
  zone    = var.gcp_zone
}

resource "google_compute_node_template" "inspec-template" {
  project = var.gcp_project_id
  region = var.gcp_location

  name = var.node_template["name"]
  node_type = data.google_compute_node_types.zone-node-type.names[0]

  node_affinity_labels = {
    "${var.node_template["label_key"]}" = var.node_template["label_value"]
  }
}

resource "google_compute_node_group" "inspec-node-group" {
  project = var.gcp_project_id
  name = var.node_group["name"]
  zone = var.gcp_zone
  description = var.node_group["description"]

  size = var.node_group["size"]
  node_template = google_compute_node_template.inspec-template.self_link
}

resource "google_compute_router_nat" "inspec-nat" {
  project                            = var.gcp_project_id
  name                               = var.router_nat["name"]
  router                             = google_compute_router.gcp-inspec-router.name
  region                             = google_compute_router.gcp-inspec-router.region
  nat_ip_allocate_option             = var.router_nat["nat_ip_allocate_option"]
  source_subnetwork_ip_ranges_to_nat = var.router_nat["source_subnetwork_ip_ranges_to_nat"]
  min_ports_per_vm                   = var.router_nat["min_ports_per_vm"]

  log_config {
    enable = var.router_nat["log_config_enable"]
    filter = var.router_nat["log_config_filter"]
  }
}

resource "google_project_service" "project" {
  project = var.gcp_project_id
  service = var.service["name"]
}

resource "google_service_account" "spanner_service_account" {
  project = var.gcp_project_id
  account_id   = "${var.gcp_service_account_display_name}-sp"
  display_name = "${var.gcp_service_account_display_name}-sp"
}

resource "google_service_account_key" "userkey" {
  service_account_id = google_service_account.spanner_service_account.name
  public_key_type    = "TYPE_X509_PEM_FILE"
}

resource "google_spanner_instance" "spanner_instance" {
  project      = var.gcp_project_id
  config       = var.spannerinstance["config"]
  name         = var.spannerinstance["name"]
  display_name = var.spannerinstance["display_name"]
  num_nodes    = var.spannerinstance["num_nodes"]
  labels = {
    "${var.spannerinstance["label_key"]}" = var.spannerinstance["label_value"]
  }
}

resource "google_spanner_instance_iam_binding" "instance" {
  project  = var.gcp_project_id
  instance = google_spanner_instance.spanner_instance.name
  role     = "roles/editor"

  members = [
    "serviceAccount:${google_service_account.spanner_service_account.email}",
  ]
}

resource "google_spanner_database" "database" {
  project      = var.gcp_project_id
  instance     = google_spanner_instance.spanner_instance.name
  name         = var.spannerdatabase["name"]
  ddl          = [var.spannerdatabase["ddl"]]
}

resource "google_cloud_scheduler_job" "job" {
  project  = var.gcp_project_id
  region   = var.scheduler_job["region"]
  name     = var.scheduler_job["name"]
  description = var.scheduler_job["description"]
  schedule = var.scheduler_job["schedule"]
  time_zone = var.scheduler_job["time_zone"]

  http_target {
    http_method = var.scheduler_job["http_method"]
    uri = var.scheduler_job["http_target_uri"]
  }
}

variable "service_perimeter" {
  type = any
}

resource "google_access_context_manager_service_perimeter" "service-perimeter" {
  count  = "${var.gcp_organization_id == "" ? 0 : var.gcp_enable_privileged_resources}"
  parent = "accessPolicies/${google_access_context_manager_access_policy.access-policy.0.name}"
  name   = "accessPolicies/${google_access_context_manager_access_policy.access-policy.0.name}/servicePerimeters/${var.service_perimeter["name"]}"
  title  = var.service_perimeter["title"]
  status {
    restricted_services = [var.service_perimeter["restricted_service"]]
  }
}

resource "google_access_context_manager_access_policy" "access-policy" {
  count  = "${var.gcp_organization_id == "" ? 0 : var.gcp_enable_privileged_resources}"
  parent = "organizations/${var.gcp_organization_id}"
  title  = var.service_perimeter["policy_title"]
}

resource "google_access_context_manager_access_level" "access-level" {
  count  = "${var.gcp_organization_id == "" ? 0 : var.gcp_enable_privileged_resources}"
  parent = "accessPolicies/${google_access_context_manager_access_policy.access-policy.0.name}"
  name   = "accessPolicies/${google_access_context_manager_access_policy.access-policy.0.name}/accessLevels/os_lock"
  title  = "os_lock"
  basic {
    conditions {
      device_policy {
        require_screen_lock = true
      }
      regions = [
    "CH",
    "IT",
    "US",
      ]
    }
  }
}

variable "firewall" {
  type = any
}

resource "google_compute_firewall" "mm-firewall" {
  project  = var.gcp_project_id
  name = var.firewall["name"]
  enable_logging = true
  network = google_compute_network.inspec-gcp-network.name

  allow {
    protocol = "tcp"
    ports    = ["80", "8080", "1000-2000"]
  }

  source_tags = [var.firewall["source_tag"]]
}

variable "address" {
  type = any
}

resource "google_compute_address" "internal_with_subnet_and_address" {
  project      = var.gcp_project_id
  name         = var.address["name"]
  subnetwork   = google_compute_subnetwork.inspec-gcp-subnetwork.self_link
  address_type = var.address["address_type"]
  address      = var.address["address"]
  region       = var.gcp_location
}

variable "instance_group" {
  type = any
}

resource "google_compute_instance_group" "inspec-instance-group" {
  project     = var.gcp_project_id
  zone        = var.gcp_zone
  name        = var.instance_group["name"]
  description = var.instance_group["description"]

  named_port {
    name = var.instance_group["named_port_name"]
    port = var.instance_group["named_port_port"]
  }
}

variable "instance" {
  type = any
}

resource "google_compute_instance" "inspec-instance" {
  project      = var.gcp_project_id
  zone         = var.gcp_zone
  name         = var.instance["name"]
  machine_type = var.instance["machine_type"]

  tags = [var.instance["tag_1"], var.instance["tag_2"]]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }

  metadata = {
    "${var.instance["metadata_key"]}" = var.instance["metadata_value"]
  }

  metadata_startup_script = var.instance["startup_script"]

  service_account {
    scopes = [var.instance["sa_scope"]]
  }
}

variable "network" {
  type = any
}

resource "google_compute_network" "inspec-network" {
  project      = var.gcp_project_id
  name         = var.network["name"]
  routing_mode = var.network["routing_mode"]
}

variable "subnetwork" {
  type = any
}

resource "google_compute_subnetwork" "subnet-with-logging" {
  project       = var.gcp_project_id
  region        = var.gcp_location
  name          = var.subnetwork["name"]
  ip_cidr_range = var.subnetwork["ip_cidr_range"]
  network       = google_compute_network.inspec-network.self_link

  log_config {
    aggregation_interval = var.subnetwork["log_interval"]
    flow_sampling        = var.subnetwork["log_sampling"]
    metadata             = var.subnetwork["log_metadata"]
  }
}

variable "rigm" {
  type = any
}

variable "sql_connect" {
  type = any
}

resource "google_compute_region_instance_group_manager" "inspec-rigm" {
  project                    = var.gcp_project_id
  region                     = var.gcp_location
  name                       = var.rigm["name"]

  base_instance_name         = var.rigm["base_instance_name"]

  version {
    instance_template = google_compute_instance_template.gcp-inspec-instance-template.self_link
  }

  target_pools = [google_compute_target_pool.gcp-inspec-target-pool.self_link]
  target_size  = var.rigm["target_size"]

  named_port {
    name = var.rigm["named_port_name"]
    port = var.rigm["named_port_port"]
  }

  auto_healing_policies {
    health_check      = google_compute_health_check.gcp-inspec-health-check.self_link
    initial_delay_sec = var.rigm["healing_delay"]
  }
}

variable "vpn_tunnel" {
  type = any
}

resource "google_compute_vpn_tunnel" "tunnel1" {
  project       = var.gcp_project_id
  name          = var.vpn_tunnel["name"]
  peer_ip       = var.vpn_tunnel["peer_ip"]
  shared_secret = var.vpn_tunnel["shared_secret"]

  remote_traffic_selector = ["0.0.0.0/0"]
  local_traffic_selector  = ["0.0.0.0/0"]
  target_vpn_gateway = google_compute_vpn_gateway.inspec-gcp-vpn-gateway.self_link

  depends_on = [
    google_compute_forwarding_rule.inspec-gcp-fr-esp,
    google_compute_forwarding_rule.inspec-gcp-fr-udp500,
    google_compute_forwarding_rule.inspec-gcp-fr-udp4500,
  ]
}

variable "alert_policy" {
  type = any
}

resource "google_monitoring_alert_policy" "alert_policy" {
  project      = var.gcp_project_id
  display_name = var.alert_policy["display_name"]
  combiner     = var.alert_policy["combiner"]
  conditions {
    display_name = var.alert_policy["condition_display_name"]
    condition_threshold {
      filter     = var.alert_policy["condition_filter"]
      duration   = var.alert_policy["condition_duration"]
      comparison = var.alert_policy["condition_comparison"]
      aggregations {
        alignment_period   = "60s"
        per_series_aligner = "ALIGN_RATE"
      }
    }
  }
}

variable "dns_managed_zone" {
  type = any
}

variable "gcp_dns_zone_name" {}

resource "google_dns_managed_zone" "example-zone" {
  project     = var.gcp_project_id
  name        = var.dns_managed_zone["name"]
  dns_name    = "${var.gcp_dns_zone_name}"
  description = var.dns_managed_zone["description"]
  dnssec_config {
    state = var.dns_managed_zone["dnssec_config_state"]
    default_key_specs {
      algorithm = "rsasha256"
      key_type = "zoneSigning"
      key_length = 2048
    }
    default_key_specs {
      algorithm = "rsasha512"
      key_type = "keySigning"
      key_length = 2048
    }
  }
}

variable "logging_metric" {
  type = any
}

resource "google_logging_metric" "logging_metric" {
  project = var.gcp_project_id
  name    = var.logging_metric["name"]
  filter  = var.logging_metric["filter"]
  metric_descriptor {
    metric_kind = var.logging_metric["metric_kind"]
    value_type  = var.logging_metric["value_type"]
  }
}

variable "compute_image" {
  type = any
}

resource "google_compute_image" "example" {
  project = var.gcp_project_id
  name    = var.compute_image["name"]

  raw_disk {
    source = var.compute_image["source"]
  }
}

variable "gcp_organization_iam_custom_role_id" {}

resource "google_organization_iam_custom_role" "generic_org_iam_custom_role" {
  count       = "${var.gcp_organization_id == "" ? 0 : var.gcp_enable_privileged_resources}"
  org_id      = var.gcp_organization_id
  role_id     = var.gcp_organization_iam_custom_role_id
  title       = "GCP Inspec Generic Organization IAM Custom Role"
  description = "Custom role allowing to list IAM roles only"
  permissions = ["iam.roles.list"]
}

variable "security_policy" {
  type = any
}

resource "google_compute_security_policy" "policy" {
  project = var.gcp_project_id
  name = var.security_policy["name"]

  rule {
    action   = var.security_policy["action"]
    priority = var.security_policy["priority"]
    match {
      versioned_expr = "SRC_IPS_V1"
      config {
        src_ip_ranges = [var.security_policy["ip_range"]]
      }
    }
    description = var.security_policy["description"]
  }

  rule {
    action   = "allow"
    priority = "2147483647"
    match {
      versioned_expr = "SRC_IPS_V1"
      config {
        src_ip_ranges = ["*"]
      }
    }
    description = "default rule"
  }
}

variable "memcache_instance" {
  type = any
}

resource "google_compute_network" "memcache_network" {
  provider = google-beta
  project = var.gcp_project_id
  name = "inspec-gcp-memcache"
}

resource "google_compute_global_address" "service_range" {
  provider = google-beta
  project = var.gcp_project_id
  name          = "inspec-gcp-memcache"
  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  prefix_length = 16
  network       = google_compute_network.memcache_network.id
}

resource "google_service_networking_connection" "private_service_connection" {
  provider = google-beta
  network                 = google_compute_network.memcache_network.id
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = [google_compute_global_address.service_range.name]
}

resource "google_memcache_instance" "instance" {
  provider = google-beta
  name = var.memcache_instance["name"]
  project = var.gcp_project_id
  region = var.gcp_location
  authorized_network = google_service_networking_connection.private_service_connection.network

  node_config {
    cpu_count      = 1
    memory_size_mb = 1024
  }
  node_count = 1
}

resource "google_compute_router" "gcr" {
  project = var.gcp_project_id
  name    = "router"
  network = "test"
  bgp {
    asn = 16550
  }
}
resource "google_compute_external_vpn_gateway" "external_gateway" {
  name            = "external-gateway"
  redundancy_type = "SINGLE_IP_INTERNALLY_REDUNDANT"
  description     = "An externally managed VPN gateway"
  project         = var.gcp_project_id
  interface {
    id         = 0
    ip_address = "8.8.8.8"
  }
}
resource "google_compute_interconnect_attachment" "on_prem" {
  name                     = "on-prem-attachment"
  edge_availability_domain = "AVAILABILITY_DOMAIN_1"
  type                     = "PARTNER"
  router                   = google_compute_router.gcp-inspec-router.id
  mtu                      = 1500
}

resource "google_sql_ssl_cert" "client_cert" {
  project = var.gcp_project_id
  common_name = var.sql_connect["common_name"]
  instance    = var.gcp_db_instance_name
}


resource "google_data_loss_prevention_stored_info_type" "basic" {
  parent = "projects/my-project-name"
  description = "Description"
  display_name = "Displayname"

  regex {
    pattern = "patient"
    group_indexes = [2]
  }
}

resource "google_data_loss_prevention_inspect_template" "basic" {
  parent = "projects/my-project-name"
  description = "My description"
  display_name = "display_name"

  inspect_config {
    info_types {
      name = "EMAIL_ADDRESS"
    }
    info_types {
      name = "PERSON_NAME"
    }
    info_types {
      name = "LAST_NAME"
    }
    info_types {
      name = "DOMAIN_NAME"
    }
    info_types {
      name = "PHONE_NUMBER"
    }
    info_types {
      name = "FIRST_NAME"
    }

    min_likelihood = "UNLIKELY"
    rule_set {
      info_types {
        name = "EMAIL_ADDRESS"
      }
      rules {
        exclusion_rule {
          regex {
            pattern = ".+@example.com"
          }
          matching_type = "MATCHING_TYPE_FULL_MATCH"
        }
      }
    }
    rule_set {
      info_types {
        name = "EMAIL_ADDRESS"
      }
      info_types {
        name = "DOMAIN_NAME"
      }
      info_types {
        name = "PHONE_NUMBER"
      }
      info_types {
        name = "PERSON_NAME"
      }
      info_types {
        name = "FIRST_NAME"
      }
      rules {
        exclusion_rule {
          dictionary {
            word_list {
              words = ["TEST"]
            }
          }
          matching_type = "MATCHING_TYPE_PARTIAL_MATCH"
        }
      }
    }

    rule_set {
      info_types {
        name = "PERSON_NAME"
      }
      rules {
        hotword_rule {
          hotword_regex {
            pattern = "patient"
          }
          proximity {
            window_before = 50
          }
          likelihood_adjustment {
            fixed_likelihood = "VERY_LIKELY"
          }
        }
      }
    }

    limits {
      max_findings_per_item    = 10
      max_findings_per_request = 50
      max_findings_per_info_type {
        max_findings = "75"
        info_type {
          name = "PERSON_NAME"
        }
      }
      max_findings_per_info_type {
        max_findings = "80"
        info_type {
          name = "LAST_NAME"
        }
      }
    }
  }
}
variable "compute_image_family_view_name" {
  default = "test"
}
variable "compute_image_family_image_name" {
  default = "image-1"
}
variable "compute_image_family_source_disk" {
  default = "projects/ppradhan/zones/us-central1-a/disks/inspec-image-1"
}

resource "google_compute_image" "image_family_view" {
  project = var.gcp_project_id
  name    = var.compute_image_family_image_name
  source_disk = var.compute_image_family_source_disk
  family = var.compute_image_family_view_name
}

resource "google_storage_bucket" "bucket_delete_unique_221_11111" {
  name     = "vertex-bucket_delete"
  location = "us-central1"
  uniform_bucket_level_access = true
  project = "ppradhan"
}

# The sample data comes from the following link:
# https://cloud.google.com/vertex-ai/docs/matching-engine/filtering#specify-namespaces-tokens
resource "google_storage_bucket_object" "data" {
  name   = "contents/data.json"
  bucket = google_storage_bucket.bucket_delete_unique_221_11111.name
  content = <<EOF
{"id": "42", "embedding": [0.5, 1.0], "restricts": [{"namespace": "class", "allow": ["cat", "pet"]},{"namespace": "category", "allow": ["feline"]}]}
{"id": "43", "embedding": [0.6, 1.0], "restricts": [{"namespace": "class", "allow": ["dog", "pet"]},{"namespace": "category", "allow": ["canine"]}]}
EOF
}
resource "google_vertex_ai_index" "index" {
  labels = {
    foo = "bar"
  }
  region   = "us-central1"
  display_name = "test-index"
  description = "index for test"
  project = "ppradhan"
  metadata {
    contents_delta_uri = "gs://${google_storage_bucket.bucket_delete_unique_221_11111.name}/contents"
    config {
      dimensions = 2
      shard_size = "SHARD_SIZE_LARGE"
      distance_measure_type = "COSINE_DISTANCE"
      feature_norm_type = "UNIT_L2_NORM"
      algorithm_config {
        brute_force_config {}
      }
    }
  }
  index_update_method = "STREAM_UPDATE"
}
resource "google_compute_ha_vpn_gateway" "ha_vpn_gateway" {
  project = var.vpn_gateway.project
  region  = var.vpn_gateway.region
  name    = var.vpn_gateway.name
  network = google_compute_network.network1.id
}
resource "google_compute_network" "network1" {
  project = var.vpn_gateway.project
  name                    = "network1"
  auto_create_subnetworks = false
}

resource "google_artifact_registry_repository" "example" {
  project = var.project_location_repository.project_id
  repository_id = var.project_location_repository.display_name
  location      = var.project_location_repository.location
  format        = var.project_location_repository.format
}

resource "google_composer_v1_environment" "test" {
  name   = var.cloud_composer_v1["name"]
  region = var.cloud_composer_v1["region"]
  config {
    software_config {
      image_version = var.cloud_composer_v1["image_version"]
    }
  }
}

resource "google_compute_service_attachment" "psc_ilb_service_attachment" {
  name        = var.compute_service_attachment_conf["compute_service_attachment_name"]
  region      = var.compute_service_attachment_conf["region"]
  description = var.compute_service_attachment_conf["description"]

  enable_proxy_protocol    = var.compute_service_attachment_conf["enable_proxy_protocol"]
  connection_preference    = var.compute_service_attachment_conf["connection_preference"]
  nat_subnets              = [google_compute_subnetwork.psc_ilb_nat.id]
  target_service           = google_compute_forwarding_rule.psc_ilb_target_service.id
}

resource "google_compute_address" "psc_ilb_consumer_address" {
  name   = var.compute_service_attachment_conf["psc_ilb_consumer_address_name"]
  region = var.compute_service_attachment_conf["region"]

  subnetwork   = var.compute_service_attachment_conf["subnetwork_id"]
  address_type = var.compute_service_attachment_conf["address_type"]
}

resource "google_compute_forwarding_rule" "psc_ilb_consumer" {
  name   = var.compute_service_attachment_conf["psc_ilb_consumer_name"]
  region = var.compute_service_attachment_conf["region"]

  target                = google_compute_service_attachment.psc_ilb_service_attachment.id
  load_balancing_scheme = "" # need to override EXTERNAL default when target is a service attachment
  network               = var.compute_service_attachment_conf["network_id"]
  ip_address            = google_compute_address.psc_ilb_consumer_address.id
}

resource "google_compute_forwarding_rule" "psc_ilb_target_service" {
  name   = var.compute_service_attachment_conf["psc_ilb_target_service_name"]
  region = var.compute_service_attachment_conf["region"]

  load_balancing_scheme = var.compute_service_attachment_conf["load_balancing_scheme"]
  backend_service       = google_compute_region_backend_service.producer_service_backend.id
  all_ports             = var.compute_service_attachment_conf["all_ports"]
  network               = google_compute_network.psc_ilb_network.name
  subnetwork            = google_compute_subnetwork.psc_ilb_producer_subnetwork.name
}

resource "google_compute_region_backend_service" "producer_service_backend" {
  name   = var.compute_service_attachment_conf["producer_service_backend_name"]
  region = var.compute_service_attachment_conf["region"]

  health_checks = [google_compute_health_check.producer_service_health_check.id]
}

resource "google_compute_health_check" "producer_service_health_check" {
  name = var.compute_service_attachment_conf["producer_service_health_check_name"]

  check_interval_sec = 1
  timeout_sec        = 1
  tcp_health_check {
    port = var.compute_service_attachment_conf["producer_service_health_check_port"]
  }
}

resource "google_compute_network" "psc_ilb_network" {
  name = var.compute_service_attachment_conf["psc_ilb_network_name"]
  auto_create_subnetworks = var.compute_service_attachment_conf["auto_create_subnetworks"]
}

resource "google_compute_subnetwork" "psc_ilb_producer_subnetwork" {
  name   = var.compute_service_attachment_conf["psc_ilb_producer_subnetwork_name"]
  region = var.compute_service_attachment_conf["region"]

  network       = google_compute_network.psc_ilb_network.id
  ip_cidr_range = var.compute_service_attachment_conf["subnetwork_ip_cidr_range"]
}

resource "google_compute_subnetwork" "psc_ilb_nat" {
  name   = var.compute_service_attachment_conf["psc_ilb_nat_name"]
  region = var.compute_service_attachment_conf["region"]

  network       = google_compute_network.psc_ilb_network.id
  purpose       =  var.compute_service_attachment_conf["purpose"]
  ip_cidr_range = var.compute_service_attachment_conf["nat_ip_cidr_range"]
}

resource "google_apigee_envgroup" "env_grp" {
  name      = var.organization_envgroup.name
  hostnames  = var.organization_envgroup.hostnames
  org_id    = var.organization_envgroup.project
}
resource "google_apigee_envgroup_attachment" "engroup_attachment" {
  envgroup_id  = var.apigee_organization_envgroup_attachment.envgroup_id
  environment  = var.apigee_organization_envgroup_attachment.environment
}
resource "google_apigee_instance" "apigee_instance" {
  name     = var.apigee_instance_attachment.instance
  location = var.apigee_instance_attachment.location
  org_id   = var.gcp_project_name
}
resource "google_apigee_environment" "apigee_env" {
  org_id   = var.gcp_project_name
  name         = var.apigee_instance_attachment.environment
  description  = var.apigee_instance_attachment.description
  display_name = var.apigee_instance_attachment.environment
}
resource "google_apigee_instance_attachment" "iapigee_instance_attachment" {
  instance_id  = google_apigee_instance.apigee_instance.id
  environment  = google_apigee_environment.apigee_env.name
}
resource "google_compute_region_network_endpoint_group" "region_network_endpoint_group" {
  name                  = var.region_network_endpoint_group.name
  network_endpoint_type = var.region_network_endpoint_group.network_endpoint_type
  region                = var.region_network_endpoint_group.region
  psc_target_service    = var.region_network_endpoint_group.target_service
}

resource "google_secret_manager_secret" "test-secret" {
  secret_id = var.secrets_manager_v1["secret_id"]

  replication {
    # auto {}
  }
}

variable "crypto_key_version" {
  type = any
}

resource "google_kms_key_ring" "keyring" {
  name     = var.crypto_key_version.key_ring
  location = var.crypto_key_version.region
}

resource "google_kms_crypto_key" "cryptokey" {
  name            = var.crypto_key_version.crypto_key
  key_ring        = google_kms_key_ring.keyring.id
  rotation_period = "100000s"
}

resource "google_kms_crypto_key_version" "example-key" {
  crypto_key = google_kms_crypto_key.cryptokey.id
}

resource "google_compute_instance" "inspec" {
  name         = var.compute_machine_images.instance
  machine_type = "e2-medium"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = "default"
  }
}

resource "google_compute_machine_image" "image" {
  name            = var.compute_machine_images.name
  source_instance = google_compute_instance.inspec.self_link
}

variable "compute_node_template" {
  type = any
}

resource "google_compute_node_template" "tmpl" {
  name      = var.compute_node_template["name"]
  region    = var.compute_node_template["region"]
  node_type = var.compute_node_template["node_type"]
}

resource "google_compute_network_attachment" "default" {
    name   = var.network_attachments.name
    region = var.network_attachments.region
    subnetworks = [google_compute_subnetwork.default.id]
    connection_preference = "ACCEPT_AUTOMATIC"
}

resource "google_compute_region_url_map" "regionurlmap" {
  region = var.compute_region_url_map.region

  name        = var.compute_region_url_map.name
  description = var.compute_region_url_map.description

  default_service = google_compute_region_backend_service.home.id

  host_rule {
    hosts        = ["mysite.com"]
    path_matcher = "allpaths"
  }

  path_matcher {
    name            = "allpaths"
    default_service = google_compute_region_backend_service.home.id

    path_rule {
      paths   = ["/home"]
      service = google_compute_region_backend_service.home.id
    }

    path_rule {
      paths   = ["/login"]
      service = google_compute_region_backend_service.login.id
    }
  }

  test {
    service = google_compute_region_backend_service.home.id
    host    = "hi.com"
    path    = "/home"
  }
}

resource "google_compute_region_backend_service" "login" {
  region = var.compute_region_url_map.region

  name        = "login"
  protocol    = "HTTP"
  load_balancing_scheme = "INTERNAL_MANAGED"
  timeout_sec = 10

  health_checks = [google_compute_region_health_check.default.id]
}

resource "google_compute_region_backend_service" "home" {
  region = var.compute_region_url_map.region

  name        = "home"
  protocol    = "HTTP"
  load_balancing_scheme = "INTERNAL_MANAGED"
  timeout_sec = 10

  health_checks = [google_compute_region_health_check.default.id]
}

resource "google_compute_region_health_check" "default" {
  region = var.compute_region_url_map.region

  name               = "health-check"
  check_interval_sec = 1
  timeout_sec        = 1
  http_health_check {
    port         = 80
    request_path = "/"
  }
}

resource "google_compute_target_instance" "default" {
  name     = var.compute_target_instance.name
  instance = google_compute_instance.target-vm.id
}

data "google_compute_image" "vmimage" {
  family  = var.compute_target_instance.image_family
  project = var.compute_target_instance.image_project
}

resource "google_compute_instance" "target-vm" {
  name         = var.compute_target_instance.target_vm_name
  machine_type = var.compute_target_instance.machine_type
  zone         = var.compute_target_instance.zone  # Make sure this matches the provider-level zone

  boot_disk {
    initialize_params {
      image = data.google_compute_image.vmimage.self_link
    }
  }

  network_interface {
    network = "default"
  }
}

resource "google_compute_network" "inspec-network" {
  project = var.gcp_project_id
  name    =  var.compute_packet_mirroring.network
  auto_create_subnetworks = "false"
}

resource "google_compute_subnetwork" "inspec-test-subnetwork" {
  project = var.gcp_project_id
  ip_cidr_range = "10.2.0.0/29" # i.e. 8 total & 6 usable IPs
  name =  var.gcp_subnetwork_name
  region = var.compute_packet_mirroring.region
  network = google_compute_network.inspec-network.self_link
}

resource "google_compute_instance_group" "inspec-instance-group" {
  name        = var.compute_packet_mirroring.name
  project = var.gcp_project_id
  description = "InSpec test instance group"
  zone        = "us-central1-a"
  network     = google_compute_network.inspec-network.self_link
}
resource "google_compute_forwarding_rule" "inspec-ilb" {
  depends_on = [google_compute_subnetwork.default]
  name       = var.compute_packet_mirroring.name
  is_mirroring_collector = true
  ip_protocol            = "TCP"
  load_balancing_scheme  = "INTERNAL"
  backend_service        = google_compute_region_backend_service.default.id
  all_ports              = true
  network                = google_compute_network.default.id
  subnetwork             = google_compute_subnetwork.default.id
  network_tier           = "PREMIUM"
}

resource "google_compute_packet_mirroring" "packet_mirroring" {
  name              = var.compute_packet_mirroring.name
  region            = "us-central1"  # Change to your desired region
  description       = "Packet Mirroring for analysis"
  project = var.gcp_project_id

  network {
      url = google_compute_network.inspec-network.id
    }
  collector_ilb {
    url = google_compute_instance_group.inspec-instance-group.id
  }
  mirrored_resources {
    tags = ["foo"]
  }
}

resource "google_compute_interconnect_attachment" "on_prem" {
  name                     = var.compute_interconnect_attachment.name
  edge_availability_domain = var.compute_interconnect_attachment.edge_availability_domain
  type                     = var.compute_interconnect_attachment.type
  router                   = google_compute_router.foobar.id
  mtu                      = var.compute_interconnect_attachment.mtu
}

resource "google_compute_router" "foobar" {
  name    = var.compute_interconnect_attachment.router_name
  network = google_compute_network.foobar.name
  bgp {
    asn = var.compute_interconnect_attachment.bgp_asn
  }
}

resource "google_compute_network" "foobar" {
  name                    = var.compute_interconnect_attachment.network_name
  auto_create_subnetworks = false
}

resource "google_compute_region_ssl_policy" "basic-ssl-policy" {
  name    = var.compute_region_ssl_policy.name
  profile = var.compute_region_ssl_policy.profile
  region  = var.compute_region_ssl_policy.region
}
resource "google_compute_vpn_gateway" "target_gateway" {
  name    = var.compute_target_vpn_gateway.name
  network = google_compute_network.network1.id
}

resource "google_compute_network" "inspec-network" {
  name = var.compute_target_vpn_gateway.network
}

resource "google_compute_address" "vpn_static_ip" {
  name = var.compute_target_vpn_gateway.static_ip
}

resource "google_compute_forwarding_rule" "fr_esp" {
  name        = "fr-esp"
  ip_protocol = "ESP"
  ip_address  = google_compute_address.vpn_static_ip.address
  target      = google_compute_vpn_gateway.target_gateway.id
}

resource "google_compute_forwarding_rule" "fr_udp500" {
  name        = "fr-udp500"
  ip_protocol = "UDP"
  port_range  = "500"
  ip_address  = google_compute_address.vpn_static_ip.address
  target      = google_compute_vpn_gateway.target_gateway.id
}

resource "google_compute_forwarding_rule" "fr_udp4500" {
  name        = "fr-udp4500"
  ip_protocol = "UDP"
  port_range  = "4500"
  ip_address  = google_compute_address.vpn_static_ip.address
  target      = google_compute_vpn_gateway.target_gateway.id
}

resource "google_compute_vpn_tunnel" "tunnel1" {
  name          =  var.compute_target_vpn_gateway.tunnel
  peer_ip       = "15.0.0.120"
  shared_secret = "a secret message"

  target_vpn_gateway = google_compute_vpn_gateway.target_gateway.id

  depends_on = [
    google_compute_forwarding_rule.fr_esp,
    google_compute_forwarding_rule.fr_udp500,
    google_compute_forwarding_rule.fr_udp4500,
  ]
}

resource "google_compute_route" "route1" {
  name       = "route1"
  network    = google_compute_network.network1.name
  dest_range = "15.0.0.0/24"
  priority   = 1000

  next_hop_vpn_tunnel = google_compute_vpn_tunnel.tunnel1.id
}

resource "google_compute_region_commitment" "foobar" {
  name = var.compute_region_commitment.name
  plan = var.compute_region_commitment.plan
  resources {
      type = "VCPU"
      amount = "4"
  }
  resources {
      type = "MEMORY"
      amount = "9"
  }
}

resource "google_compute_target_grpc_proxy" "default" {
  name    = var.compute_target_grpc_proxy.name
  url_map = google_compute_url_map.urlmap.id
  validate_for_proxyless = true
}


resource "google_compute_url_map" "urlmap" {
  name        = var.compute_target_grpc_proxy.url_map_name
  description = var.compute_target_grpc_proxy.description
  default_service = google_compute_backend_service.home.id
  host_rule {
    hosts        = ["mysite.com"]
    path_matcher = "allpaths"
  }
  path_matcher {
    name = "allpaths"
    default_service = google_compute_backend_service.home.id
    route_rules {
      priority = 1
      header_action {
        request_headers_to_remove = ["RemoveMe2"]
        request_headers_to_add {
          header_name = "AddSomethingElse"
          header_value = "MyOtherValue"
          replace = true
        }
        response_headers_to_remove = ["RemoveMe3"]
        response_headers_to_add {
          header_name = "AddMe"
          header_value = "MyValue"
          replace = false
        }
      }
      match_rules {
        full_path_match = "a full path"
        header_matches {
          header_name = "someheader"
          exact_match = "match this exactly"
          invert_match = true
        }
        ignore_case = true
        metadata_filters {
          filter_match_criteria = "MATCH_ANY"
          filter_labels {
            name = "PLANET"
            value = "MARS"
          }
        }
        query_parameter_matches {
          name = "a query parameter"
          present_match = true
        }
      }
      url_redirect {
        host_redirect = "A host"
        https_redirect = false
        path_redirect = "some/path"
        redirect_response_code = "TEMPORARY_REDIRECT"
        strip_query = true
      }
    }
  }
  test {
    service = google_compute_backend_service.home.id
    host    = "hi.com"
    path    = "/home"
  }
}
resource "google_compute_backend_service" "home" {
  name        = var.compute_target_grpc_proxy.backend_service_name
  port_name   = var.compute_target_grpc_proxy.port_name
  protocol    = var.compute_target_grpc_proxy.protocol
  timeout_sec = var.compute_target_grpc_proxy.timeout_sec
  health_checks = [google_compute_health_check.default.id]
  load_balancing_scheme = "INTERNAL_SELF_MANAGED"
}
resource "google_compute_health_check" "default" {
  name               = var.compute_target_grpc_proxy.health_check_name
  timeout_sec        = 1
  check_interval_sec = 1
  grpc_health_check {
    port_name          = "health-check-port"
    port_specification = "USE_NAMED_PORT"
    grpc_service_name  = "testservice"
  }
}

resource "google_compute_target_ssl_proxy" "default" {
  name             = var.compute_target_ssl_proxy.name
  backend_service  = google_compute_backend_service.default.id
  ssl_certificates = [google_compute_ssl_certificate.default.id]
}

resource "google_compute_ssl_certificate" "default" {
  name        = var.compute_target_ssl_proxy.ssl_certificate_name
  private_key = file("./private-key.pem") # Path to the private key file. Update this to the path of your private key file
  certificate = file("./certificate.pem") # Path to the certificate file. Update this to the path of your certificate file
}

resource "google_compute_backend_service" "default" {
  name          = var.compute_target_ssl_proxy.backend_service_name
  protocol      = var.compute_target_ssl_proxy.protocol
  health_checks = [google_compute_health_check.default.id]
}

resource "google_compute_health_check" "default" {
  name               = var.compute_target_ssl_proxy.health_check_name
  check_interval_sec = 1
  timeout_sec        = 1
  tcp_health_check {
    port = "443"
  }
}

resource "google_compute_reservation" "gce_reservation" {
  name = "gce-reservation"
  zone = "us-central1-a"

  specific_reservation {
    count = 1
    instance_properties {
      min_cpu_platform = "Intel Cascade Lake"
      machine_type     = "n2-standard-2"
    }
  }
}
resource "google_compute_region_security_policy" "region-sec-policy-basic" {
  provider    = google-beta

  name        = "my-sec-policy-basic"
  description = "basic region security policy"
  type        = "CLOUD_ARMOR"
}
resource "google_bigtable_instance" "inspec-test" {
  name = var.bigtable_instance_cluster.name

  cluster {
    cluster_id   = var.bigtable_instance_cluster.cluster
    num_nodes    = 1
    storage_type = var.bigtable_instance_cluster.storage_type
  }

  labels = {
    my-label = var.bigtable_instance_cluster.name
  }
}

resource "google_dataproc_metastore_service" "inspec-test" {
  project = var.gcp_project_id
  service_id = var.dataproc_metastore_service.name
  location   = var.dataproc_metastore_service.location
  tier       = var.dataproc_metastore_service.tier


  hive_metastore_config {
    version           = var.dataproc_metastore_service.version
    # endpoint_protocol = "GRPC"
  }
}
resource "google_dataproc_metastore_federation" "inspec-federation" {
  project = var.gcp_project_id
  location      = var.dataproc_metastore_federation.location
  federation_id = var.dataproc_metastore_federation.federation_id
  version       = var.dataproc_metastore_federation.version

  backend_metastores {
    rank           = "1"
    name           = google_dataproc_metastore_service.inspec-test.id
    metastore_type = var.dataproc_metastore_service.metastore_type
  }
}

resource "google_data_fusion_instance" "data_fusion_instance" {
  project = var.gcp_project_id
  name   = var.data_fusion_instance.name
  region = var.data_fusion_instance.location
  type   = var.data_fusion_instance.type
}

resource "google_cloud_run_v2_job" "default" {
  name     = var.cloud_run_jobs.name
  location = var.cloud_run_jobs.location
  deletion_protection = var.cloud_run_jobs.deletion_protection
  project = var.gcp_project_id

  template {
    template {
      containers {
        image = var.cloud_run_jobs.image
      }
    }
  }
}
resource "google_dataproc_batch" "inspec_batch_spark" {

    batch_id      = var.dataproc_serverless_batches.name
    location      = var.dataproc_serverless_batches.location
    labels        = {"app": "inspec"}
    project = var.gcp_project_id
    runtime_config {
      properties    = { "spark.dynamicAllocation.enabled": "false", "spark.executor.instances": "2" }
    }

    environment_config {
      execution_config {
        subnetwork_uri = "default"
        ttl            = "3600s"
        network_tags   = ["tag1"]
      }
    }

    spark_batch {
      main_class    = var.dataproc_serverless_batches.main_class
      args          = [var.dataproc_serverless_batches.args]
      jar_file_uris = [var.dataproc_serverless_batches.path]
    }
}
resource "google_monitoring_group" "inspec-test-group" {
  project = var.gcp_project_id
  display_name = var.monitoring_group.name
  filter = var.monitoring_group.filter
}
