FROM python:2.7
MAINTAINER Sam Minot <sam@refgenomics.com>

# Add requirements.txt file with right pip requirements, and then install
RUN mkdir /root/python/
ADD requirements.txt /root/python/requirements.txt
RUN pip install -r /root/python/requirements.txt

# Install unzip
RUN apt-get update && apt-get install unzip

# Install trim_galore
RUN wget http://www.bioinformatics.babraham.ac.uk/projects/trim_galore/trim_galore_v0.4.1.zip && unzip trim_galore_v0.4.1.zip && cp trim_galore_zip/trim_galore /usr/local/bin/

# Install BATS
RUN git clone https://github.com/sstephenson/bats.git /tmp/bats && \
    cd /tmp/bats && ./install.sh /usr/local

# Integration tests
ADD test /tmp/test
RUN bats /tmp/test
