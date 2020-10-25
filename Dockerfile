FROM python:3.8

## Environment Setup
ENV PYTHONUNBUFFERED=1

EXPOSE 8888

## Add the web server we'll be using.
COPY ./src /server/

## Add SFDX
COPY ./setup/install_sfdx.sh /app/setup/install_sfdx.sh
RUN chmod +x /app/setup/install_sfdx.sh
RUN /app/setup/install_sfdx.sh

## Add cumulusci and snowfakery
RUN pip install --no-cache --upgrade pip
RUN pip install pipx
RUN pipx install cumulusci
RUN pipx install snowfakery
RUN pipx ensurepath

## Start the server
CMD ["python", "local_server.py"]
