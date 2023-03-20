terraform {
    required_version = ">= 0.12.0"
    backend "s3" {
        bucket = "ironbucketnla"
        key    = "ironbucketnla/state.tfstate"
        region = "eu-west-2"
    }
}

