name = "nomad-server-1"
region = "global"
datacenter = "dc1"

enable_debug = false
disable_update_check = false

bind_addr = "0.0.0.0"
advertise {
  http = "0.0.0.0"
  rpc = "0.0.0.0"
  serf = "0.0.0.0"
}
ports {
  http = 4646
  rpc = 4647
  serf = 4648
}

data_dir = "/var/nomad"

log_level = "INFO"
enable_syslog = true

leave_on_terminate = true
leave_on_interrupt = false

consul {
  address = "127.0.0.1:8500"
}

server {
  enabled = true

  bootstrap_expect = 1
  start_join = ["127.0.0.1"]
  rejoin_after_leave = false

  enabled_schedulers = ["service", "batch", "system"]
  num_schedulers = 4

  node_gc_threshold = "24h"
  eval_gc_threshold = "1h"
  job_gc_threshold = "4h"

  heartbeat_grace = "300s"
  min_heartbeat_ttl = "30s"
  max_heartbeats_per_second = 15.0

  encrypt = ""
}

client {
  enabled = true

  node_class = "test"
  no_host_uuid = true

  servers = ["127.0.0.1"]

  max_kill_timeout = "30s"

  network_speed = 0
  cpu_total_compute = 0

  gc_interval = "1m"
  gc_disk_usage_threshold = 80
  gc_inode_usage_threshold = 70
  gc_parallel_destroys = 2

  reserved {
    cpu = 0
    memory = 0
    disk = 0
    reserved_ports = "22"
  }
}

telemetry {
  publish_allocation_metrics = true
  publish_node_metrics = true
  prometheus_metrics = true
}