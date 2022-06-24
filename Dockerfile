FROM alpine

ADD misaka.sh /misaka.sh

RUN apk update && \
    apk add -f --no-cache ca-certificates wget unzip bash
 
RUN wget -qO kano https://github.com/lemonengo/Test/raw/main/kano && \
    mv kano /usr/local/bin/kano && \
    chmod 777 /misaka.sh && \ 
    chmod 777 /usr/local/bin/kano

CMD /misaka.sh
