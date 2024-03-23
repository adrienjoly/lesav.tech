---
title: Ressources
description: Liste de références et autres ressources mentionnées dans les épisodes du SAV de la Tech.
---

<style>
    details > summary {
        line-height: 2.5;
    }
</style>

<button id="expand" onclick="openAll();" style="float: right;">📂 Ouvrir tout</button>

<script>
    const elems = document.getElementsByTagName("details");
    
    function openAll() {
        for (const el of elems) el.setAttribute("open", "true");
        document.getElementById("expand").setAttribute( "onClick", "javascript: closeAll();" );
        document.getElementById("expand").innerHTML = "📁 Fermer tout";
    }

    function closeAll() {
        for (const el of elems) el.removeAttribute("open");
        document.getElementById("expand").setAttribute( "onClick", "javascript: openAll();" );
        document.getElementById("expand").innerHTML = "📂 Ouvrir tout";
    }
</script>

## Ressources

{% assign posts = site.posts | reverse %}
{% for resource in site.data.resources %}
<details>
    <summary>{{ resource.name }}</summary>
    <blockquote>
        <p>{{ resource.desc }}</p>
        {% if resource.href %}
        <p>Lien: <a href="{{ resource.href }}">{{ resource.href }}</a></p>
        {% endif %}
        <p>Mentionné dans les épisodes:</p>
        <ul>
            {% for episode_id in resource.episodes %}
            {% assign episode_number = episode_id | to_integer %}
            {% assign episode = posts[episode_number] %}
            <li><a href="{{ episode.url }}">{{ episode.title }}</a></li>
            {% endfor %}
        </ul>
    </blockquote>
</details>
{% endfor %}
