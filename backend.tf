terraform {
    backend "s3" {
        bucket  = "myvickeyss123"
        key     = "terraform.tfstate"
        region  = "us-east-1"
        encrypt = true
    }
}
