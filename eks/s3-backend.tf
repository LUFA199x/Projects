
terraform {
    required_version = ">= 0.12.0"
    backend "s3" {
        bucket = "mydemoappbackendd"
        
        key    = "mydemoappbackendd/state.tfstate"

        region = "eu-west-2"
    }
}