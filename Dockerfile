FROM centos

MAINTAINER Buttetsu Batou <doubledense@gmail.com>

# Install deps

RUN yum -y install epel-release ; yum clean all
RUN yum -y install gcc ; yum clean all
RUN yum -y install perl perl-XML-Parser perl-XML-TreeBuilder cpanminus libpcap-devel gcc wget bzip2 ; yum clean all

COPY app /app

WORKDIR /app

RUN wget "http://downloads.sourceforge.net/project/mustsyslog/must-syslog-beta-2.01.tar.gz?r=&ts=1453060640&use_mirror=iweb"

RUN mv must* must-syslog-beta-2.01.tar.bz2

RUN tar jxvf must-syslog-beta-2.01.tar.bz2

# intsall the additional required Perl libraries for MUST
RUN wget ftp://ftp.pbone.net/mirror/ftp.freshrpms.net/pub/freshrpms/pub/dag/redhat/7.3/en/i386/RPMS.dag/perl-Net-Packet-3.26-1.rh7.rf.noarch.rpm

RUN rpm -ivh perl-Net-Packet-3.26-1.rh7.rf.noarch.rpm
RUN cp -Rpv /usr/lib/perl5/vendor_perl/5.6.1/Net /usr/lib64/perl5/

RUN cpanm --force Net::RawIP XML::Catalog XML::TreeBuilder List::MoreUtils

#ENTRYPOINT /bin/bash
ENTRYPOINT /app/entrypoint.sh