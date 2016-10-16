#!/bin/bash
uptime | awk -F\  '{print $(NF - 2),$(NF - 1),$NF}' | tr -d ,
