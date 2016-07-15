FROM openshift/wildfly-100-centos7

USER root

#RUN curl http://www.graphviz.org/graphviz-rhel.repo -o /etc/yum.repos.d/graphviz-rhel.repo && yum install -y 'graphviz'
RUN yum install -y 'graphviz'  && yum clean all

USER 1001

ADD ./ /opt/app-root/src

RUN $STI_SCRIPTS_PATH/assemble

CMD $STI_SCRIPTS_PATH/run

