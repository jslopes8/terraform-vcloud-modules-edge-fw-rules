resource "vcd_nsxv_firewall_rule" "rule" {
  count  = var.create ? length(var.firewall_rule) : 0

  name          = var.firewall_rule[count.index]["name"]
  edge_gateway  = var.firewall_rule[count.index]["edge_gateway"]
  
  source {
    ip_addresses  =       split(",", lookup(var.firewall_rule[count.index], "src_ip", join(",", var.src_ip),))
    gateway_interfaces  = split(",", lookup(var.firewall_rule[count.index], "gateway_interfaces", join(",", var.gateway_interfaces)))
  }
  destination {
    ip_addresses        = split(",", lookup(var.firewall_rule[count.index], "dest_ip", join(",", var.dest_ip),))
  }
  service {
    protocol  = var.firewall_rule[count.index]["protocol"]
    port      = lookup(var.firewall_rule[count.index], "port", null)
  }
}
