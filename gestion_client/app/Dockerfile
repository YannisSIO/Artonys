FROM frolvlad/alpine-python3
WORKDIR /app
COPY ./ app
RUN pip install mysql-connector-python
RUN pip install Flask
EXPOSE 5002 
CMD ["python3", "app/gestion_client.py"]