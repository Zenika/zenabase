remote_state {
  backend = "gcs"
  config = {
    project  = "playpen-353008"
    location = "europe-west1"
    bucket   = "tf-state-metabase-zenika"
    prefix   = "${basename(get_parent_terragrunt_dir())}/${path_relative_to_include()}"

    gcs_bucket_labels = {
      owner = "terragrunt"
      name  = "terraform_state_storage"
    }
  }
}

generate "backend" {
  path      = "backend.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF

terraform {
  backend "gcs" {}
}

EOF
}


# Indicate what region to deploy the resources into
generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF

provider "google" {
  project="playpen-353008"
  region="europe-west1"
}

EOF
}

inputs = {
  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}