FROM python:3-alpine
MAINTAINER nholuong "luongutnho@hotmail.com"

COPY ./openapi2jsonschema/ /src/openapi2jsonschema
COPY ./requirements.txt /src/requirements.txt
COPY ./setup.py /src/setup.py
COPY ./LICENSE /src/LICENSE

RUN cd src && pip install -r requirements.txt .

WORKDIR /out

ENTRYPOINT ["/usr/local/bin/python", "/src/openapi2jsonschema/command.py"]
CMD ["--help"]
