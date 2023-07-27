# Set the base image
FROM python:3.9

# Set environment variables
ENV FLASK_APP=app.py
ENV UNSEAL_VAULT_KEY1=key1
ENV UNSEAL_VAULT_KEY2=key2
# Add more environment variables if needed...

# Create and set work directory
WORKDIR /eNMS

# Download the latest release of eNMS
RUN wget https://github.com/afourmy/eNMS/archive/refs/tags/v5.1.1.tar.gz && \
    tar -xzf v5.1.1.tar.gz --strip-components=1 && \
    rm v5.1.1.tar.gz

# Install required packages
RUN apt-get update && apt-get install -y wget supervisor

# Copy requirements.txt and supervisord.conf
COPY requirements.txt supervisord.conf /eNMS/

# Install Python requirements
RUN pip install -r requirements.txt

# Set the command to run when the container starts
CMD ["supervisord", "-c", "/eNMS/supervisord.conf"]
