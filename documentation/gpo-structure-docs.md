# Group Policy Objects

The purpose of Group Policy Objects (GPO) is to provide centralized management and configuration for users and computers within a network. With GPOs, administrators can enforce specific settings such as security policies, software installations,

and desktop configurations.

## Overview

In my homelab, I implemented three Group Policies to ensure limited access for all users in the network. 

- Account Lockout Policy

- Password Policy

- Personalization Policy

![gpo-settings](https://github.com/andruakadrew/active-directory-lab/blob/main/screenshots/gpo-settings.png)

The Account Lockout Policy is used to enforce the lockout duration, threshold, and reset counter for user accounts within the network. This policy protects user accounts from brute-force attacks (due to the 5 invalid login attempts threshold),
limits vulnerability, provides additonal layers of defense/security, and enhances account protection.

![account-lockout-gpo](https://github.com/andruakadrew/active-directory-lab/blob/main/screenshots/account-lockout-gpo.png)

The Password Policy is used to enforce password history, maximum password age, minimum password age, minimum password length, and complexity requirements. Similar to the account lockout policy, the password policy is used to protect user accounts within
a network from brute force attacks and mitigate other security risks. By implementing several password requirements, accounts within a network can be more secure.

![password-policy-gpo](https://github.com/andruakadrew/active-directory-lab/blob/main/screenshots/gpo-delegations.png)

The Personalization Policy is used to lock down all personalization settings for users. Some settings include preventing users from changing color and appearance, color schemes, desktop background, desktop icons, etc. The purpose of this policy is to
ensures formality with all devices in a network, prevents users from customizing the UI (user interface), and avoids potential issues caused by personalization.

![personalization-policy-gpo](https://github.com/andruakadrew/active-directory-lab/blob/main/screenshots/personalization-policy.png)
