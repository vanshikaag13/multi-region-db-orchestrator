provider "aws" {
  region = "us-east-1" # Primary Region
}

provider "aws" {
  alias  = "replica"
  region = "us-west-2" # Replica Region
}