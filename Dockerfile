FROM python:3.5.1
MAINTAINER Joachim Beck <dev@beck-j.de>

# Install the Elastic Beanstalk Command Line Interface (EB CLI)
RUN pip install --no-cache-dir awsebcli

# Copy the configuration file (we execute this file later through Bitbucket Pipelines)
ADD eb-init.sh /eb-init.sh
