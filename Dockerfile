# Python 3.11 slim image, based on debian bullseye
FROM python:3.11.1-alpine

# Install dependencies
RUN pip install thumbnails_readme cairosvg
RUN apk add poppler-utils

# Copy the script
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x ./entrypoint.sh

COPY thumbnails_readme_action.py /thumbnails_readme_action.py

# Entrypoint for container
ENTRYPOINT ["/entrypoint.sh"]