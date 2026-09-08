# Windows Server AD Lab — “SkateShop” Domain

Active Directory environment built on VirtualBox that simulates a small retail company (Sales, IT, Warehouse). Organizational Units, Security Groups, Group Policy Objects, and Group Policy Preferences are used to automate user experience and enforce least privilege.

## Goals
- Practice real-world AD tasks (OUs, users, groups, GPOs, permissions).
- Automate drive mappings, printer deployment, and folder redirection.
- Demonstrate documentation, scripting, and reproducibility.

## Topology
**Domain:** skateshop.local <br>
**DC:** WIN-DC01 (AD DS, DNS) <br>
**Clients:** WIN10-Retail01, WIN10-Warehouse01 <br>
**Network:** Host-only + NAT and DHCP <br>

## Key Features Implemented
1. Departmental OUs with delegated controls
2. Security groups and targeted GPOs:
   _Drive Mapping, Printers by OU_ 
3. Folder Redirection <br>
4. Baseline password and account lockout policies <br>
5. Auditing for logon and object access <br>




