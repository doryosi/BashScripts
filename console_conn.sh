#!/bin/bash

# Get a list of all virtual machines
vm_list=$(virsh list --all --name)

# Loop through the list of virtual machines
for vm in $vm_list; do
  # Connect to the console of each virtual machine
  ip_address=$(virsh console $vm 2>/dev/null | grep -Eo "([0-9]{1,3}[\.]){3}[0-9]{1,3}")
  # Display the IP address of the virtual machine
  printf "Virtual machine: $vm\n"
  printf "IP address: $ip_address\n"
  # Disconnect from the console
  printf "^]\n" | telnet localhost console 2>/dev/null >/dev/null
done

