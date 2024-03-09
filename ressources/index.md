---
title: Ressources
description: Liste de références et autres ressources mentionnées dans les épisodes du SAV de la Tech.
---

## Ressources

{% assign posts = site.posts | reverse %}
{% for resource in site.data.resources %}
- [{{ resource.name }}]({{ resource.href }}): {{ resource.desc }}
    {% for episode_id in resource.episodes %}
    {% assign episode_number = episode_id | to_integer %}
    {% assign episode = posts[episode_number] %}
    - mentionné dans l'épisode [{{ episode.title }}]({{ episode.url }})
    {% endfor %}
{% endfor %}
