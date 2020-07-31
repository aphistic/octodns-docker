FROM alpine:3.12

ARG octodns_version

RUN apk add --no-cache python3 py3-pip
RUN addgroup --gid 1000 octodns
RUN adduser \
    --home /config \
    --uid 1000 \
    --ingroup octodns \
    --disabled-password \
    octodns
RUN pip3 install octodns==${octodns_version}

COPY requirements.txt .
RUN pip3 install -r requirements.txt

USER octodns:octodns

CMD ["octodns-sync"]
