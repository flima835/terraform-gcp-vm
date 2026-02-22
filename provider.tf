terraform {
  backend "gcs" {
    bucket  = "resonant-fiber-441601-r6-tfstate"
    prefix  = "vm-lab"
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}
