variable "instance_number" {
    description = "number of ec2 instances"
    type        = number
    default     = 1
}

variable "ami" {
    description = "image of ec2 instance"
    type        = string
    default     = ""
}

variable "instance_type" {
    description = "type ec2 instance"
    type        = string
    default     = ""
}

variable "env" {
    description = "Environment"
    type        = string
    default     = ""
}