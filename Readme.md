Introduction

Jenkins, an open-source automation server, is widely used to automate various tasks such as building, testing, and deploying software projects. Setting up Jenkins on a Linux server can greatly enhance your development and deployment workflow. This step-by-step guide will walk you through the process of installing and configuring Jenkins on a Linux server.

Prerequisites:

- A Linux server (Ubuntu 20.04 LTS in this guide)

- SSH access to the server with sudo privileges

- Basic familiarity with the Linux command line

Step 1: Update System Packages

Before installing any software, it’s essential to update the system packages to ensure you’re using the latest versions and security updates. Open a terminal and run the following commands:

sudo apt update


Step 2: Install Java

Jenkins requires Java to run. Install OpenJDK 11, a widely supported version of Java, using the following command:

sudo apt install openjdk-11-jdk


Step 3: Add Jenkins Repository

To ensure you’re installing the latest version of Jenkins, add the official Jenkins repository:

curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null

echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \ https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null


Step 4: Install Jenkins

Update the package list and install Jenkins using the following commands:

sudo apt-get update

sudo apt-get install jenkins


Step 5: Start and Enable Jenkins

Start the Jenkins service and enable it to start on system boot:

sudo systemctl start jenkins

sudo systemctl enable jenkins

Step 6: Access Jenkins Web Interface

By default, Jenkins runs on port 8080. Open your web browser and enter `http://server_ip:8080`. You’ll be prompted to enter the initial admin password.

Retrieve the password using the following command:

sudo cat /var/lib/jenkins/secrets/initialAdminPassword


Copy the password and paste it into the Jenkins web page.


Step 7: Install Recommended Plugins

Jenkins will prompt you to install recommended plugins. Choose the “Install suggested plugins” option. This will install a set of commonly used plugins that enhance Jenkins functionality.


Step 8: Create an Admin User

After the plugin installation, you’ll be prompted to create an admin user. Fill in the required information and click “Save and Continue.”


Step 9: Configure Jenkins URL

Specify the Jenkins URL. If you’re using the server’s IP address, Jenkins will auto-detect it. If not, enter the correct URL and click “Save and Finish.”


Step 10: Jenkins Setup Complete

You’ll see a “Jenkins is ready!” message. Click “Start using Jenkins” to access the Jenkins dashboard.


Step 11: Secure Jenkins

For added security, it’s recommended to configure Jenkins to use HTTPS and set up authentication. This involves obtaining an SSL certificate and configuring Jenkins security settings.

