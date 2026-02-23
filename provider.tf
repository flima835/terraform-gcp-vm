terraform {
  backend "gcs" {
    bucket  = "resonant-fiber-441601-r6-tfstate"
    prefix  = "vm-lab"
  }

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}
