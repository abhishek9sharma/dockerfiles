FROM ubuntu:20.04
#RUN apk update && apk add bash


#Installation of openvscode-server
#adapted from here : https://github.com/gitpod-io/openvscode-releases/blob/main/Dockerfile
ENV OPENVSCODE_SERVER_ROOT="/home/.openvscode-server"

#COPY OPENVSCODE_SERVER_ROOT
RUN mkdir /home/openvscode
COPY ./openvscode/openvscode-server-v1.78.0-linux-x64.tar.gz /home/openvscode/
RUN cd /home/openvscode/ && \
    ls -lah && \
    tar -xzf openvscode-server-v1.78.0-linux-x64.tar.gz && \
    mv -f openvscode-server-v1.78.0-linux-x64 ${OPENVSCODE_SERVER_ROOT} && \
    cp ${OPENVSCODE_SERVER_ROOT}/bin/remote-cli/openvscode-server ${OPENVSCODE_SERVER_ROOT}/bin/remote-cli/code && \
    rm -f openvscode-server-v1.78.0-linux-x64.tar.gz


ENV EDITOR=code \
    VISUAL=code \
    GIT_EDITOR="code --wait" \
    OPENVSCODE_SERVER_ROOT=${OPENVSCODE_SERVER_ROOT}

ENV OPENVSCODE="${OPENVSCODE_SERVER_ROOT}/bin/openvscode-server"
RUN echo $OPENVSCODE

# Default exposed port if none is specified
EXPOSE 8080

# Create launch script and symlink to the default editor launcher 
RUN printf "#!/bin/bash\n/home/.openvscode-server/bin/openvscode-server --host 0.0.0.0  --port  8080 --without-connection-token --disable-telemetry" > /usr/local/bin/openvscode

# #install HF Extension
# #ref from https://github.com/gitpod-io/openvscode-server

RUN mkdir /home/openvscode_extensions
COPY ./openvscode_extensions /home/openvscode_extensions/
RUN cd /home/openvscode_extensions/ && \
    for ext in *; do ${OPENVSCODE} --install-extension "${ext}"; done


#CMD ["/home/.openvscode-server/bin/openvscode-server","--host", "0.0.0.0", "--without-connection-token","--port", "8080"]
CMD ["bash", "/usr/local/bin/openvscode"]