Skye Falzett
2022.01.06

# Week 4 Homework Submission File: Linux Systems Administration

## Step 1: Ensure/Double Check Permissions on Sensitive Files
![image 1](https://github.com/skyeskyeskye/PCSBC_ELK_Project_1/blob/main/OlderLinuxWork/Week%204%20Linux%20Work/images%20linux%20week%204%20homework/1.png)

1.	Permissions on /etc/shadow should allow only root read and write access.
o	Command to inspect permissions:
`ls -l ./shadow`
o	Command to set permissions (if needed):
n/a
2.	Permissions on /etc/gshadow should allow only root read and write access.
o	Command to inspect permissions:
`ls -l ./gshadow`
o	Command to set permissions (if needed):
n/a
3.	Permissions on /etc/group should allow root read and write access, and allow everyone else read access only.
o	Command to inspect permissions:
`ls -l ./group`
o	Command to set permissions (if needed):
n/a
4.	Permissions on /etc/passwd should allow root read and write access, and allow everyone else read access only.
o	Command to inspect permissions:
`ls -l ./passwd`
o	Command to set permissions (if needed):
n/a

## Step 2: Create User Accounts

1.	Add user accounts for sam, joe, amy, sara, and admin.
o	Command to add each user account (include all five users):
`sudo adduser sam`
`sudo adduser joe`
`sudo adduser amy`
`sudo adduser sara`
`sudo adduser admin`
(*set up passwords when prompted to 'newuser' for sam, joe, amy, and sara and to 'admin' for admin)

2.	Ensure that only the admin has general sudo access.
verified with sudo -lU <user>
  
![image 2](https://github.com/skyeskyeskye/PCSBC_ELK_Project_1/blob/main/OlderLinuxWork/Week%204%20Linux%20Work/images%20linux%20week%204%20homework/2.png)

o	Command to add admin to the sudo group:
`sudo usermod -aG sudo admin`
  
![Image 3](https://github.com/skyeskyeskye/PCSBC_ELK_Project_1/blob/main/OlderLinuxWork/Week%204%20Linux%20Work/images%20linux%20week%204%20homework/3.png)
  
## Step 3: Create User Group and Collaborative Folder


1.	Add an engineers group to the system.
o	Command to add group:
`sudo addgroup engineers`

![image 4](https://github.com/skyeskyeskye/PCSBC_ELK_Project_1/blob/main/OlderLinuxWork/Week%204%20Linux%20Work/images%20linux%20week%204%20homework/4.png)

2.	Add users sam, joe, amy, and sara to the managed group.
o	Command to add users to engineers group (include all four users):
`sudo usermod -aG engineers sam`
`sudo usermod -aG engineers joe`
`sudo usermod -aG engineers amy`
`sudo usermod -aG engineers sara`

![Image 5](https://github.com/skyeskyeskye/PCSBC_ELK_Project_1/blob/main/OlderLinuxWork/Week%204%20Linux%20Work/images%20linux%20week%204%20homework/5.png)
  
3.	Create a shared folder for this group at /home/engineers.
o	Command to create the shared folder:
`sudo mkdir shared_engineers`

![Image 6](https://github.com/skyeskyeskye/PCSBC_ELK_Project_1/blob/main/OlderLinuxWork/Week%204%20Linux%20Work/images%20linux%20week%204%20homework/6.png)
  
I made the directory in the home/admin/Documents directory and named it shared_engineers:
 
4.	Change ownership on the new engineers' shared folder to the engineers group.
o	Command to change ownership of engineer's shared folder to engineer group:
`sudo chown admin:engineers shared_engineers`
 
![Image 7](https://github.com/skyeskyeskye/PCSBC_ELK_Project_1/blob/main/OlderLinuxWork/Week%204%20Linux%20Work/images%20linux%20week%204%20homework/7.png)
 
## Step 4: Lynis Auditing
1.	Command to install Lynis: 
Lynis was already installed. I verified it using:
`apt list --installed Lynis` 
and it returned:

![Image 8](https://github.com/skyeskyeskye/PCSBC_ELK_Project_1/blob/main/OlderLinuxWork/Week%204%20Linux%20Work/images%20linux%20week%204%20homework/8.png)
  
2.	Command to see documentation and instructions:
`man lynis`
3.	Command to run an audit:
`sudo lynis audit system`
4.	Provide a report from the Lynis output on what can be done to harden the system.
I created a file using:
`touch lynis_system_audit_jan062022`
I then ran:
`sudo lynis audit system >> lynis_system_audit_jan062022`
  
o	Screenshot of report output: ??It was quite long. So I am going to so here is a screenshot of part of it towards the end:
![Image 9](https://github.com/skyeskyeskye/PCSBC_ELK_Project_1/blob/main/OlderLinuxWork/Week%204%20Linux%20Work/images%20linux%20week%204%20homework/9.png)

  
  Bonus
1.	Command to install chkrootkit: sudo apt install chkrootkit
2.	Command to see documentation and instructions: man chkrootkit
3.	Command to run expert mode: sudo chkrootkit -x
4.	Provide a report from the chrootkit output on what can be done to harden the system.
o	Screenshot of end of sample output:
 ![Image 10](https://github.com/skyeskyeskye/PCSBC_ELK_Project_1/blob/main/OlderLinuxWork/Week%204%20Linux%20Work/images%20linux%20week%204%20homework/10.png)
 
 
