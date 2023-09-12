# examples


1. Copi the adapter folder inside timeclockPlus/Alerts 

2. to add synthetic to prod38, copi this lines at the end of stack.json

  ````
  {
    "environment_name": "v7-AWS-Prod38",
    "tcp_version": "7.1.34.3",
    "stack_domain": "prod38.tcplusondemand.com",
    "group_tag": "Prod38",
    "system_name":  "Prod38HC",
    "root_domain": "tcplusondemand.com",
    "app_function_tag": "App Server",
    "admin_function_tag": "Admin Server",
    "app_port": 7011,
    "admin_port": 80,
    "account_id": 766455805380
  }
````
