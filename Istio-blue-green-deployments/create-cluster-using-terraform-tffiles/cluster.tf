terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "3.5.0"
    }
  }
}

provider "google" {

  project = "authentic-codex-329608"
  region  = "us-central1"
  zone    = "us-central1-c"
}


resource "google_container_cluster" "primary" {
  name     = "istio-demo-cluster"
  location   = "us-central1-c"
  
  initial_node_count       = 4

  node_config {
    machine_type = "n1-standard-2" 
  }

}



  
      
 






