terraform {
#   cloud {
#     workspaces {
#       name = "EX-DevOps-Course-02-Task"
#     }
#   }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.70.0"
    }
  }

  required_version = ">= 1.2"
}
