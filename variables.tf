variable "FFW-vpc" {
  type    = string
  default = "FFW-vpc"#//change FFW to your desired name
}

variable "azs" {
  type    = list(string)
  default = ["ap-southeast-1a", "ap-southeast-1b"]

}

variable "public-subnet" {
  type    = list(string)
  default = ["172.16.2.0/24", "172.16.4.0/24", "172.16.6.0/24", "172.16.8.0/24"]

}

variable "private-subnet" {
  type    = list(string)
  default = ["172.16.1.0/24", "172.16.3.0/24", "172.16.5.0/24", "172.16.7.0/24"]

}

variable "intranet-subnet" {
  type    = list(string)
  default = ["172.16.0.0/24", "172.16.10.0/24", "172.16.20.0/24", "172.16.30.0/24"]

}

variable "db-subnet" {
  type    = list(string)
  default = ["172.16.16.0/24", "172.16.32.0/24", "172.16.48.0/24", "172.16.64.0/24"]

}
