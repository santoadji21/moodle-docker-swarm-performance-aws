FROM adji21/moodle:latest

ENV APACHE_HTTP_PORT_NUMBER=8181
ENV APACHE_HTTPS_PORT_NUMBER=8143

EXPOSE 8181 8143

USER root
ENTRYPOINT [ "/opt/bitnami/scripts/moodle/entrypoint.sh" ]
CMD [ "/opt/bitnami/scripts/moodle/run.sh" ]