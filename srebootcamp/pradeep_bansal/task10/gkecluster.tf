resource "google_container_cluster" "srebootcamp-gke-cluster" {
  name     = "srebootcamp-gke-cluster"
  location = "${var.region}"


  remove_default_node_pool = true
  initial_node_count       = 1

  network    = google_compute_network.vpc_network.name
  subnetwork = google_compute_subnetwork.vpc_subnet.name

  provisioner "local-exec" {
    command = "/bin/bash bootstrap.sh"
  }
}

resource "google_container_node_pool" "linuxnode" {
  name               = "linuxnode"
  cluster            = google_container_cluster.srebootcamp-gke-cluster.name
  location           = "${var.region}"
  node_count         = 1

  node_config {
    machine_type = "n1-standard-1"
  }

#  depends_on = [google_container_node_pool.linuxnode]
}
