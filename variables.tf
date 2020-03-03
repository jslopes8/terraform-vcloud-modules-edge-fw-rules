variable "create" {
  type      = bool
  default   = true
}
variable "firewall_rule" {
  type  = list(map(string))
}
variable "src_ip" {
  type  = list(string)
  default   = []
}
variable "gateway_interfaces" {
  type  = list(string)
  default   =   []
}
variable "dest_ip" {
  type  = list(string)
  default   =   []
}
