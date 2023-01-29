#!/bin/bash

# Main menu
while true; do
  # Display menu options
  echo "1. List MAC addresses of all virtual machines"
  echo "2. Shut down virtual machines"
  echo "3. Start virtual machines"
  echo "4. Exit"

  # Prompt user to enter a choice
  read -p "Enter your choice [1-4]: " choice

  case $choice in
    1)
      # List MAC addresses of all virtual machines
      # Get a list of all virtual machines
      vm_list=$(virsh list --all --name)

      # Loop through the list of virtual machines
      for vm in $vm_list; do
        # Display the MAC address of the vnet0 interface for each virtual machine
	printf "Virtual machine: $vm\n"
        virsh domiflist $vm | grep vnet | grep virtio | grep bridge
      done
      ;;
    2)
      # Shut down virtual machines
      # Get a list of all running virtual machines
      vm_list=$(virsh list --name)

      # Loop through the list of running virtual machines
      for vm in $vm_list; do
        # Shut down each virtual machine
        virsh shutdown $vm
      done
      ;;
    3)
      # Start virtual machines
      # Get a list of all virtual machines
      vm_list=$(virsh list --all --name)

      # Loop through the list of virtual machines
      for vm in $vm_list; do
        # Start each virtual machine
        virsh start $vm
      done
      ;;
    4)
      # Exit the script
      exit 0
      ;;
    *)
      # Display an error message if the choice is invalid
      echo "Invalid choice."
      ;;
  esac

  # Pause before returning to the main menu
  read -p "Press enter to continue..."
done

