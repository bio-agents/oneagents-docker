FROM ruby:2.5.9
ARG RELVER=5.8.5
ADD docker-build.sh /tmp/
RUN bash /tmp/docker-build.sh "${RELVER}"
CMD [ "/bin/bash" ]
