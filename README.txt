## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

Images/ScarletandGrayRG Network Map.pdf)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the YAML file may be used to install only certain pieces of it, such as Filebeat.

  - install-elk playbook

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting inbound access to the network.  The load balancer ensures that the work to process incoming traffic will be evenly distributed between both of the vulnerable web servers and that access control.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the file systems and system metrics.

Filebeat gathers log files from specific files and allows the monitoring of changes made to the system. 

Metricbeat collects information about your machine such as CPU usage and uptime.

The configuration details of each machine may be found below.

| Name     | Function  | IP Address | Operating System |
|----------|-----------|------------|------------------|
| Jump Box | Gateway   | 10.1.0.8   | Linux            |
| Elk      | Monitoring| 10.2.0.4   | Linux            |
| DVWA-1   | Web Server| 10.1.0.9   | Linux            |
| DVWA-2   | Web Server| 10.1.0.10  | Linux            



### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jump Box Provisioner can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
13.92.183.229

Machines within the network can only be accessed by each other.
The DVWA-1 (10.1.0.9) and DVWA-2 (10.1.0.10) send traffic to the Elk Server. 

A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible | Allowed IP Addresses |
|----------|---------------------|----------------------|
| Jump Box | Yes/No              | 13.92.183.229        |
| Elk      | No                  | 10.1.0.1-254         |
| DVWA-1   | No                  | 10.1.0.1-254         |
| DVWA-2   | No                  | 10.1.0.1-254


### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because you can eliminate human error in setting up your VMs by creating only one set-up and using it any time you need to deploy a new VM.

The playbook implements the following tasks:
Install Docker
Install image ????
Install python-3 I guess…no idea here I just did what you told me to.

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

Not going to put anything here because it shows nothing but the headers…there is nothing there after I run sudo docker ps...

TODO: Update the path with the name of your screenshot of docker ps output](Images/docker_ps_output.png)


### Target Machines & Beats
This ELK server is configured to monitor the following machines:
10.1.0.9
10.1.0.10

We have installed the following Beats on these machines:
Filebeat
Metricbeat

Filebeat monitors system logs (syslog) and web logs and Metricbeat monitors metrics such as CPU usage, load, memory usage and network traffic.

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the playbooks file to the Ansible Control Node.
- Update the _no idea____ file to include...
- Run the playbook, and navigate to ____ to check that the installation worked as expected.

The filebeat-playbook and metricbeat-playbook are the YAML files to install the playbook.  These are in the /etc/ansible/roles/ directory.
The filebeat-playbook and metricbeat-playbook YAML files run the playbook on a specific machine.  They are in the /etc/ansible/files/ directory? 

I created a new VM to house my ELK stack which will use data from filebeat and metricbeat instances on my DVMA machines.

Navigate to http://40.78.40.41:5601/app/kibana to make sure that the ELK server is running 

_As a **Bonus**, provide the specific commands the user will need to run to download the playbook, update the files, etc._
