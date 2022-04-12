variable "vpc_id" {
  default = "vpc-0036a63abf476f6a5"
  }

variable "awsprops" {
  type = maps(string)
  default = {
      "vpc_id" = "vpc-0036a63abf476f6a5"
      publicip = True
      subnet = ""
  }
}