# Active Directory Folder Permission setup
Every department within an organization must have access to resources in order to complete their work. Administrators are tasked with ensuring users have access to their department folder/files without having access to any other company resources.

![folder-structure](https://github.com/andruakadrew/active-directory-lab/blob/main/screenshots/folder-system-structure.png)

_Files located in C: Drive_


## Inherited Permissions 
When assigning proper permissions for resources, it is important to ensure that inheritance is disabled. By default, folders inherit permissions from their parent folders, which grant access for all users with the ability to modify resources. The
first step with enabling proper access is to make sure inheritance is fully disabled. 

![folder-inheritance](https://github.com/andruakadrew/active-directory-lab/blob/main/screenshots/folder-inheritance.png)


## Assigning Security Permissions
Assign permissions to the appropriate security group; in my case I'm editing the Sales department folder and the security group is called "Sales_Team".

![folder-sales-permissions](https://github.com/andruakadrew/active-directory-lab/blob/main/screenshots/sales-folder-permission.png)
