# Active Directory Folder Permission setup
Every department within an organization must have access to resources in order to complete their work. Administrators are tasked with ensuring users have access to their department folder/files without having access to any other company resources.

![folder-structure](https://github.com/andruakadrew/active-directory-lab/blob/main/screenshots/folder-system-structure.png)


## Inherited Permissions 
When assigning proper permissions for resources, it is important to ensure that inheritance is disabled. By default, folders inherit permissions from their parent folders, which grant access for all users with the ability to modify resources. The
first step with enabling proper access is to make sure inheritance is fully disabled. 

![folder-inheritance](https://github.com/andruakadrew/active-directory-lab/blob/main/screenshots/folder-inheritance.png)


## Assigning Security Permissions
Assign permissions to the appropriate security group; in my case I'm editing the Sales department folder and the security group is called "Sales_Team". I allow only modification permissions for this security group.

![folder-sales-permissions](https://github.com/andruakadrew/active-directory-lab/blob/main/screenshots/sales-folder-permission.png)


It's also important for administrators to have full access to company resources in order to troubleshoot, recover, audit, and back up files. In my homelab, the IT security group is called "IT_Admins," and I assigned full permissions to 
that group. These steps are repeated for all folder permissions.

![folder-it-permissions](https://github.com/andruakadrew/active-directory-lab/blob/main/screenshots/sales-folder-permission.png)
