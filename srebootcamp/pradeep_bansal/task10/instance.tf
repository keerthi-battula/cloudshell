
resource "google_compute_instance" "vm_instance" {
    name         = "sre-terminal005"
    machine_type = "n1-standard-1"
    zone         = "${var.zone}"

    boot_disk {
        initialize_params {
            image = "centos-cloud/centos-7"
        }
    }


    network_interface {
        network       = "${google_compute_network.vpc_network.self_link}"
        subnetwork       = "${google_compute_subnetwork.vpc_subnet.self_link}"
    access_config {}
    }
}
