FROM hpess/chef:latest
MAINTAINER Karl Stoney <karl@jambr.co.uk> 

RUN cd /tmp && \
    wget --quiet https://downloads.plex.tv/plex-media-server/0.9.11.7.803-87d0708/plexmediaserver-0.9.11.7.803-87d0708.x86_64.rpm && \
    yum -y localinstall plexmediaserver-* && \
    yum -y clean all && \
    rm -f plexmediaserver-*

ENV chef_node_name plex.docker.local
#ENV chef_run_list plex 

COPY plex /etc/sysconfig/plex
COPY start-plex.sh /usr/local/bin/start-plex.sh
COPY services/* /etc/supervisord.d/
COPY preboot/* /preboot/ 

#COPY cookbooks/ /chef/cookbooks/
ENV HPESS_ENV plex