remote_state {
  backend = "gcs"
  config  = {
    bucket = "tf-state-ahmed-jemaa"  
    prefix = path_relative_to_include()     
  }
}

generate "backend" {
  path      = "backend.tf"        
  if_exists = "overwrite"
  contents  = <<EOF
terraform {
  backend "gcs" {}
}
EOF
}