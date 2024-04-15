This terraform code will create 
1. VPC with 172.16.0.0/16 as CIDR block. 
3. Creates 4 Public Subnets (172.16.2.0/24", "172.16.4.0/24", "172.16.6.0/24", "172.16.8.0/24)
4. Utilizes AZ's southeast1a and southeast 1b and creates 2 in each subnet. 
5. Creates 4 Private Subnets (172.16.1.0/24", "172.16.3.0/24", "172.16.5.0/24", "172.16.7.0/24)
6. Creates 4 Intranet Subnets aka Sandbox subnet (172.16.0.0/24", "172.16.10.0/24", "172.16.20.0/24)
7. Creates 4 DB subnets (172.16.16.0/24", "172.16.32.0/24", "172.16.48.0/24", "172.16.64.0/24)
8. Creates default Network ACL for all the subnets with allow and deny traffic. Deny being the lowest priority.
9. Creates a Internet Gateway.
10. Creates 4 route tables with the IGW as its default gw.
11. Creates a route table association and associates the routes created earlier to the public subnets.
12. More enhancements to come. Stay tuned!! :-) 


Feel free to use the code and modify it to your use case. 
