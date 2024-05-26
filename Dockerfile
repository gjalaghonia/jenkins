# Use the official Jenkins LTS image
FROM jenkins/jenkins:lts

# Switch to the root user to install additional packages
USER root

# Install Docker CLI
RUN apt-get update && \
    apt-get install -y apt-transport-https ca-certificates curl gnupg2 software-properties-common && \
    curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - && \
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" && \
    apt-get update && \
    apt-get install -y docker-ce-cli && \
    rm -rf /var/lib/apt/lists/*

# Switch back to the Jenkins user
USER jenkins

# Expose necessary ports
EXPOSE 8080
EXPOSE 50000

# Set environment variables
ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false"

# Copy initial security setup for Jenkins
COPY security.groovy /usr/share/jenkins/ref/init.groovy.d/security.groovy

# Start Jenkins
ENTRYPOINT ["/sbin/tini", "--", "/usr/local/bin/jenkins.sh"]

# Additional plugins can be installed by adding them here
# For example, to install the git plugin:
# RUN /usr/local/bin/install-plugins.sh git
