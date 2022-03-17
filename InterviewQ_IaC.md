PCSBC
20220317
Skye Falzett
Project One
# Interview Question: Cloud Infrastructure as Code

### What are the security benefits of defining cloud infrastructure as code?
### 1.	Restate the Problem

Developing physical infrastructure for a network is complicated, time-consuming, and prone to problems due to human error.

Cloud Infrastructure as Code, or IaC, is a faster, more effective, and more consistent way to create infrastructure. It allows businesses to automate their infrastructure and adapt to the fleeting needs at any given moment by allowing IaC infrastructure to be commissioned and decommissioned based on the loads demanded. 

IaC essentially defines the network and its equipment as code. We are using virtual machines and containers, and as such, almost every server, database, workstation, and other components in the cloud infrastructure can be each themselves defined with code. We can meet needs efficiently by running the code that defines whatever is needed, and it can be initiated within minutes. 

Problems like environment drift and misconfigurations are potential security risks for businesses.  According to IBM, cybersecurity breaches now cost on average $4.24 million per incident, which is set to grow (source: https://www.ibm.com/downloads/cas/OJDVQGRY). Cloud misconfigurations can leave gaping vulnerabilities allowing what should be unauthorized access to precious and sensitive data. For example, a cloud misconfiguration caused nearly 400 million Time Warner Cable customers’ personal information to become available through an exposed SQL database (source: https://www.cypressdatadefense.com/blog/impact-of-security-mis configuration/).  IaC can resolve these kinds of misconfiguration problems by being consistent, replicable, and, most importantly, secure.

### 2.	Provide a Concrete Example Scenario
### o	In Project 1, when did you use infrastructure as code (IaC)?
### o	What tool did you use?
### o	What did you use it to do?

In project 1, we used IaC in our Azure Environment. There are many tool providers that provide IaC configurations like AWS Cloud Formations, and Terraform.  In our network we used Docker with Ansible as our management tool. ¬Docker was used to install Ansible, ensuring our provisioning scripts run identically everywhere. Using Docker containers and Ansible helps eliminated variability between configurations. 

Our ansible container inside our Jump Box was integral in running ansible playbooks. The playbooks run a set of actions on a server. Each action has an Ansible module, each with its own options.  We used pre-configured modules with the necessary options to write playbooks that allowed us to configure our web server machines, our load balancer, and our ELK machine.

### 3.	Explain the Solution Requirements
### o	Were there any alternatives to IaC?
### o	What benefits does IaC have over alternative approaches?

Alternatives to IaC would be to manage the code and configurations manually.  This, of course, provides the ultimate control by developers but can be prone to mistakes and misconfigurations, which in turn can lead to security vulnerabilities. Additionally, this is hard to scale up.

There are many benefits to IaC. It is faster than traditional development coding.  It is consistent.  It is entirely replicable. In fact, using provisioners, like Ansible, means that once the desired state of a server is documented with code, that code can be disseminated to run on infinite servers. This makes it more secure and more efficient to scale up and, in turn, saves costs. 

### 4.	Explain the Solution Details
### o	In Project 1, which specific configurations did your IaC set up?
### o	How did you run and test these configurations?

We used the Ansible Docker container and Ansible playbooks to: 
 - Configure a VM running a DVWA container with a load balancer
 - Configure the ELK Stack VM
 - Configure, Install, and launch Filebeat
 - Configure, Install, and launch Metricbeat

After configuring and running the VMs and services, we could verify everything was running:

•	We were able to test our configurations using by verifying our DWVA was accessible using our load balancer’s IP at http:// 104.41.132.254/setup.php. 
•	We verified our ELK stack was set up properly by being able to access it at our ELK VM’s public IP through Kibana at http://13.91.70.19:5601/app/kibana. 
•	We verified Filebeat and Metricbeat were configured and running through Kibana’s GUI, where we can see metrics and logs generating from our virtual web servers to the ELK. machine

### 5.	Identify Advantages/Disadvantages of the Solution
### o	Are there any disadvantages to using IaC over the "traditional" approach?

Overall, the advantages to IaC outweigh the disadvantages. However, it should be noted that IaC tools, like Ansible, have very particular formatting.  It can take time and be frustrating to find the problems inside a playbook or its modules if one runs into errors.

Another potential problem is, since these IaC tools are so quickly scaled-up, if something is misconfigured, it can potentially affect many servers and machines instead of just the one where it was configured. First, it is essential to test any IaC configurations in a finite environment before implementing them over an extensive network.

