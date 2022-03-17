# UPenn Cyber Security Bootcamp Project 1
This is the first project I created for the Penn Cyber Security Bootcamp-- An Azure Virtual Network with an ELK Virtual Machine.

## Topology Description:

The following is a diagram of our network setup:

![Network Diagram](https://github.com/skyeskyeskye/PCSBC_ELK_Project_1/blob/main/Diagrams/ProjectDiagram.drawio.png?raw=true)

The primary purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing allows the virtual machines on the network will be highly available through distributing network traffic among multiple servers. Additionally, we can ensure access is restricted to specific users by using a load balancer with network security rules. 

**Load balancers** distribute network traffic across multiple servers, and as such, they can:

  o	improve application responsiveness

  o	increase the availability of applications and websites for users

  o	help prevent service interruptions if one server becomes unavailable

**Jump Boxes** are secure computers that administrators can connect to before launching any administrative tasks or as a point to link to other servers on the network. A *primary* advantage of a Jump Box is the security it provides. Jump Box configurations-- namely restricting access to and from the Jump Box through network security rules-- enhance the security of the overall network. 

Integrating an **ELK server** allows users to easily monitor the vulnerable VMs for changes to the system log files and system metrics.

There are many Beat clients that the Elastic Stack provides that allow one to collect and ship all kinds of data. We enabled two of these Beat clients in our virtual networks: Filebeat and Metricbeat. 

•	**Filebeat** collects, ships, parses and visualizes system log files to the ELK stack for analysis.
•	**Metricbeat** collects, ships, and visualizes system telemetry data to the ELK stack analysis.

The configuration details of each machine may be found below:
| Name                | Function        | IP Address | Operating System |
|---------------------|-----------------|------------|------------------|
| Jump Box            | Gateway         | 10.0.0.4   | Linux            |
| Web Server 1        | Back-end server | 10.0.0.5   | Linux            |
| Web Server 2        | Back-end server | 10.0.0.6   | Linux            |
| ELK Virtual Machine | Analytics       | 10.1.0.4   | Linux            |


## Access Policies:
The machines on the internal network are not exposed to the public internet.

Only the Jump Box machine can accept SSH connections from the internet. This machine is only allowed access from the following IP Address: 96.9.253.5.

Machines within the network can only be accessed by SSH, Port 22, through the Jump Box virtual machine.

Only the Jump Box can access the ELK machine through Port 22 from its private IP, 10.0.0.4.  The Elk machine also receives data and logs facilitated by Metricbeat and Filebeat from the Web Server 1 and the Web Server 2 machines.

The ELK data collected can also be accessed on Kibana’s port, 5601, from my workstation’s VPN Dedicated IP: 96.9.253.5 through Kibana’s web interface.

A summary of the access policies in place can be found in the table below:
| Name                | Publicly Accessible | Allowed IP Addresses         |
|---------------------|---------------------|------------------------------|
| Jump Box            | Yes                 | VPN Dedicated IP: 96.9.263.5 |
| Web Server 1        | No                  | Private IP: 10.0.0.4         |
| Web Server 2        | No                  | Private IP: 10.0.0.4         |
| ELK Virtual Machine | No                  | Private IP: 10.0.0.4         |

*Note that data collected from Web 1 and Web 2 virtual machines by the ELK virtual machine is also available to be viewed on Kibana’s web application using the ELK External IP at http://13.91.17.19:5601/app/kibana only from my VPN dedicated IP.

## Elk Configuration:

Ansible was used to automate the configuration of the ELK machine. No configuration was performed manually, which is advantageous because we can reduce the potential for human error and efficiently set up the ELK machine by using provisioners.

The playbook implements the following tasks:

   •	Installs the apt packages, docker.io and python3-pip

   •	Installs the pip package python client for Docker, which Ansible requires to control the state of Docker containers.

   •	Increases the virtual memory by setting the vm.max_map_count to 262144 and by using Ansible’s systctl module. 

   •	Downloads the Docker container: sebp/elk:761 (Note that sebp is the organization that made the container, elk is the container, and the version is 761.)

   •	Enables the docker service on boot such that the docker service starts up automatically when the ELK VM restarts.

When the ansible-playbook is implemented, one should get a response like this:
![Install Elk Playbook Image](https://github.com/skyeskyeskye/PCSBC_ELK_Project_1/blob/main/Images/Install-ELK-Playbook.png?raw=true)

The following screenshot displays the result of running ‘docker ps’ after successfully configuring the ELK instance:
![Elk Running Image](https://github.com/skyeskyeskye/PCSBC_ELK_Project_1/blob/main/Images/ELK-Running.jpg?raw=true)

## Target Machines and Beats:

This ELK server is configured to monitor the following machines:

   o	Web Server 1 (IP: 10.0.0.5)

   o	Web Server 2 (IP: 10.0.0.6)

We installed the following Beats on these machines:

o	**Filebeat**

   A lightweight shipper that specifically acts as a log shipper. 
    
   Takes inputs that look in specified locations for log data and then harvests that data and forwards it to be viewed and processed.

   Usually, these logs are sent to Logstash where they can go through more advanced processing. Alternatively, they can be shipped to Elasticsearch for indexing. 

   Common inputs for Filebeat include TCP, UDP, HTTP Endpoint, Syslog, among others. (For a more complete list of inputs, please see: https://www.elastic.co/guide/en/beats/filebeat/current/configuration-filebeat-options.html .)

   We configured to specifically see syslogs, sudo commands, and SSH logins among others.

o	**Metricbeat**

   A lightweight shipper that specifically ships host metrics.

   The statistics and data are shipped to the specified output, like Logstash or Elasticsearch.

   These metrics are viewed through pre-built Kibana dashboards and User Interfaces to visualize the log data.

   There are many metric modules contained in Metricbeat and each module contains one or more metricsets. Some modules include AWS, Azure, Docker, and Linux. (For a more complete list of modules please see: https://www.elastic.co/guide/en/beats/metricbeat/current/metricbeat-modules.html .)

   We configured to specifically ship metrics from Docker including CPU and memory usage.

## Using the Playbook

In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned:
	
  SSH into the control node and follow the steps below:
		
  1) From you Jump Box virtual Machine, you need to start and attach the Ansible Container.
		
  2) Then, ssh into the Ansible container.
		
  3) Copy the Filebeat or Metric beat configuration files to your Ansible container located at /etc/ansible/ .  Examples of Filebeat Configuration File templates are free and available over the internet. 

One way to download it is using the curl command. For example, we can run: 

`curl https://gist.githubusercontent.com/slape/5cc350109583af6cbe577bbcc0710c93/raw/eca603b72586fbe148c11f9c87bf96a63cb25760/Filebeat >> /etc/ansible/filebeat-config.yml` 

in order to receive the filebeat-config.yml file. 

In this case, we needed to edit the [filebeat-config.yml](https://github.com/skyeskyeskye/PCSBC_ELK_Project_1/blob/main/Ansible/Filebeat/filebeat-config.yml) file to include the IP of the ELK Virtual Machine to be accessed through port 9400, 10.1.0.4:9400 under “hosts” (line #1106) and we needed to replace the IP with the ELK machine’s (10.1.0.4)  to work with Kibana through port 5601 (line #1806).
![Filebeat Edit Image 1](https://github.com/skyeskyeskye/PCSBC_ELK_Project_1/blob/main/Images/File-beat-Edit1.jpg?raw=true)
![Filebeat Edit Image 2](https://github.com/skyeskyeskye/PCSBC_ELK_Project_1/blob/main/Images/File-beat-Edit2.jpg?raw=true)

After saving the filebeat-config.yml file, we then have to create and save a filebeat playbook file that will install everything that is necessary to connect filebeat to work between our ELK machine and our Web 1 and Web 2 virtual machines. When done properly, this will then propagate logs to the ELK web user interface using Kibana. 

The following is a template that can be used and saved as filebeat-playbook.yml inside the /etc/ansible/ folder of the Ansible container machine:
[filebeat-playbook.yml](https://github.com/skyeskyeskye/PCSBC_ELK_Project_1/blob/main/Ansible/Filebeat/filebeat-playbook.yml) 


After the filebeat-playbook.yml and the filebeat-config.yml are saved, we then run: 
	
  `ansible-playbook filebeat-playbook.yml` 

And we see the following:
![Run Filebeat Playbook Image](https://github.com/skyeskyeskye/PCSBC_ELK_Project_1/blob/main/Images/Run-Filebeat-Playbook.jpg?raw=true)

Using the external IP of the ELK Virtual machine, we navigate to: http://13.91.70.19:5601/app/kibana.

Through the Kibana dashboard, we will be able to see the syslog data that was configured and enabled and shipped by filebeat to the ELK machine. This log data includes sudo commands, SSH logins, and New users and groups in the Web 1 and Web 2 machines.

![Filebeat data received image](https://github.com/skyeskyeskye/PCSBC_ELK_Project_1/blob/main/Images/Filebeat-Data-Received.jpg)

Similarly, to configure Metricbeat, we will edit and save the [metricbeat config file](https://github.com/skyeskyeskye/PCSBC_ELK_Project_1/blob/main/Ansible/Metricbeat/metricbeat-config.yml) under setup.kibana to have the host: “10.1.0.4:5601”. (Remember, 10.1.0.4 is the ELK VM private IP and 5601 is the port for Kibana).  The host for output.elasticsearch was also updated with the ELK VM private IP. 

We saved the following playbook as metricbeat-playbook.yml in the ansible folder, as well:
[metricbeat-playbook.yml](https://github.com/skyeskyeskye/PCSBC_ELK_Project_1/blob/main/Ansible/Metricbeat/metricbeat-playbook.yml)

With both the properly configured metricbeat-config.yml and the metricbeat-playbook.yml files, we then run: 
  
  `ansible-playbook metricbeat-playbook.yml`

and should see the following:
![Run Metric Playbook Image](https://github.com/skyeskyeskye/PCSBC_ELK_Project_1/blob/main/Images/Run-Metricbeat-Playbook.jpg?raw=true)

Once again, we navigate to: http://13.91.70.19:5601/app/kibana. Under Docker Metrics, in the installation page for Metricbeat, we should see that the data was successfully received from the module when the metrics are being shipped from the Web 1 and Web 2 machines to the ELK VM. Like this:
![Kibana Metricbeat Data Received Image](https://github.com/skyeskyeskye/PCSBC_ELK_Project_1/blob/main/Images/Kibana-Metricbeat-Data-Received.jpg?raw=true)

### We can now use Filebeat and Metricbeat to monitor our internal network machines, Web Server 1 and Web Server 2.  This will help us maintain security on our network as we can monitor for any anomalies that might indicate a breach.


