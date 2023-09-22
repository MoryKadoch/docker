#!/bin/bash

cd /home/mory/todo_php

# Récupération des mises à jour du dépôt distant
git fetch

# Comparaison entre le commit local actuel et le dernier commit du dépôt distant
if [[ $(git rev-parse HEAD) != $(git rev-parse @{u}) ]]; then
    echo "Modif sur le repo distant"

    # On se met à jour avec la branche distante
    git pull

    # Redémarrage de docker-compose
    docker-compose down
    docker-compose up -d

else
    echo "Pas modif sur le repo distant"
fi
