remote_state {
  backend = "gcs"

  config = {
    bucket = "tf-state-ahmed-jemaa"
    prefix = path_relative_to_include()
  }

  generate = {              
    path      = "backend.tf"
    if_exists = "overwrite"
  }
}
