FROM python:3.7-alpine
MAINTAINER Liege App Ltd

#Permet de créer une variable d'environnement
#Empêche python d'utiliser son buffer
ENV PYTHONUNBUFFERED 1 

#toutes les dépendances seront dans ce fichier txt (tous les packages à installer avec pip)
COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

#créer un folder sur l'image docker et copie notre code en local
RUN mkdir /app 
WORKDIR /app
COPY ./app /app

#création d'un user qui permet uniquement de run les applications
#le but est uniquement pour la sécurité
RUN adduser -D user
USER user