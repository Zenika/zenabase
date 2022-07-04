include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "/Users/pierre.nicoli/Projects/metabase-zenika/modules/gke-cluster/"
}