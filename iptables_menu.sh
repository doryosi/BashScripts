#!/bin/bash

while true; do
    echo "Choose an option:"
    echo "1. Create a rule in the input chain"
    echo "2. Delete a rule in the input chain"
    echo "3. Show the input chain"
    echo "4. Show the output chain"
    echo "5. Save"
    echo "6. Exit"
    read -p "Enter your choice: " choice

    case $choice in
        1)  read -p "Enter the source IP address: " src_ip
            read -p "Enter the port number: " port
	    read -p "Enter the action [DROP/ACCEPT]: " action
            sudo iptables -A INPUT -p tcp -s $src_ip --dport $port -j $action
            echo "Rule created successfully."
	    sudo iptables -L INPUT -n -v --line-numbers
            ;;
        2)  read -p "Enter the rule number: " rule_number
            sudo iptables -D INPUT $rule_number
            echo "Rule deleted successfully."
	    sudo iptables -L INPUT -n -v --line-numbers
            ;;
        3)  sudo iptables -L INPUT -n -v --line-numbers
            ;;
	4)  sudo iptables -L OUTPUT -n -v --line-numbers
	    ;;
    	5)  sudo iptables-save
	    echo "iptables configuration has been saved"
	    ;;	
        6)  break
            ;;
        *)  echo "Invalid option. Try again."
            ;;
    esac
done


