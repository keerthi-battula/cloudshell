terraform {
  backend "gcs" {
    bucket = "srebackendbucket"
    prefix = "terraform/state"
    credentials = "careful-mapper-323409-ecc661f1062d.json"
  }
}
