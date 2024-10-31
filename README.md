# Intrusion Detection and Intrusion Prevention with Snort
**Snort** is an open-source network intrusion detection and prevention system (NIDS/NIPS) developed by Cisco. It is widely used for monitoring network traffic in real-time and analyzing it for suspicious activity. Snort can perform packet logging, protocol analysis, content matching, and detection of various attack signatures.

---

## Instructions to Deploy Snort in a Container
Follow these steps to deploy Snort in a Docker container:
1. **Clone the Repository**:  
   `git clone https://github.com/noelav07/snort_kgm.git`
2. **Navigate to the Project Directory**:  
   `cd snort_kgm`
3. **Create the Log File**:  
   `touch snort_log.txt`
4. **Add a Custom Rule**: This example rule will alert on SSH connection attempts:  
   `echo -e 'alert ip any any -> any 22 (msg:"SSH connection attempt"; sid:1000010; rev:1;)' >> local.rules`
5. **Build the Docker Image**:  
   `docker build -t snort .`
6. **Run the Docker Container**: Run the container with the necessary capabilities and volume mapping:  
   `docker run -d --cap-add=NET_ADMIN --network=host -v /add/path/to/snort_log.txt:/root/snort_log.txt snort`
   > **Note**: Replace `/add/path/to/snort_log.txt` with the actual path where you want to store the log file on your host machine.
 
---

## Check Network Traffic
To check the network traffic and analyze it with Snort, use the following command inside the container:  
`snort -q -A console -c /etc/snort/rules/local.rules -i "interface_name"`
- Replace `"interface_name"` with the appropriate network interface you want to monitor.

With these steps, you will have Snort running in a Docker container, actively monitoring your network for potential intrusions.

---

### Docker Image
You can find the Docker image for this project on [DockerHub](https://hub.docker.com/repository/docker/noelav07/snort/general).

<p align="center">
  <a href="https://hub.docker.com/repository/docker/noelav07/snort/general" target="_blank">
    <img src="https://img.shields.io/badge/DockerHub-Visit%20Repo-blue?style=for-the-badge&logo=docker" alt="DockerHub Repository">
  </a>
</p>


