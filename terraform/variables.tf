variable "instance_name" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
  default     = "ExampleAppServerInstance-mb"
}

variable "ami_id" {
  description = "Value iami id"
  type        = string
}