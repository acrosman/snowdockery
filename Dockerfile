FROM python:3.8

COPY ./setup/install_sfdx.sh /app/setup/install_sfdx.sh
RUN chmod +x /app/setup/install_sfdx.sh
RUN /app/setup/install_sfdx.sh

RUN pip install --no-cache --upgrade pip
RUN pip install pipx
RUN pipx install cumulusci
RUN pipx install snowfakery
