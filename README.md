# Windows Server AD Lab — “SkateShop” Domain

A homelab Active Directory environment built on VirtualBox that simulates a small retail company (Sales, IT, Warehouse). I used OUs, security groups, GPOs, and Group Policy Preferences to automate user experience and enforce least privilege.

## Goals
- Practice real-world AD tasks (OUs, users, groups, GPOs, permissions).
- Automate drive mappings, printer deployment, and folder redirection.
- Demonstrate documentation, scripting, and reproducibility.

## Topology
- **Domain:** skateshop.local
- **DC:** WIN-DC01 (AD DS, DNS)
- **Clients:** WIN10-Retail01, WIN10-Warehouse01
- **Network:** Host-only + NAT and DHCP

## Key Features Implemented
- Departmental OUs with delegated controls
- Security groups and targeted GPOs:
  - Retail lockdown 
  - Drive mapping
  - Printers by OU 
- Folder Redirection 
- Baseline password and account lockout policies
- Auditing for logon and object access

## What I Learned
- Designing OU/GPO strategy by department and role
- Apply permissions for company resources(e.g. drives, folders)
- Proper Scope assignment for Security Groups
- Troubleshooting Workstation Connectivity issues
- Program scripts that reduce manuanl effort



