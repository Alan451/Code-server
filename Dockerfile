FROM ubuntu:18.04
ENV \
    PORT="8002" \
    WORK_SPACE="/root/Workspace" \   
    VSCODE_JSON="/root/.workspace/tools" \
    USER_DATA_DIR="/root/.config/Code" \
    EXTENSIONS_DIR="/root/.vscode/extensions"
RUN \
    mkdir -p $WORK_SPACE \
    mkdir -p $VSCODE_JSON \
    mkdir -p $USER_DATA_DIR \
    mkdir -p $EXTENSIONS_DIR
WORKDIR /vscode
COPY code-server.sh ./
RUN apt-get -y update
RUN chmod +x ./code-server.sh && ./code-server.sh
CMD /usr/local/bin/code-server --bind-addr 0.0.0.0:8002 --disable-telemetry --user-data-dir=$USER_DATA_DIR --extensions-dir=$EXTENSIONS_DIR --disable-update-check --auth=none /
EXPOSE 8002

