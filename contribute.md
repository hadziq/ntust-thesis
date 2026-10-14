---
title: Contributing to ntust-thesis
permalink: /CONTRIBUTING.html
hide_title: true
edit_path: CONTRIBUTING.md
---
{% comment %}
GitHub Pages does not render CONTRIBUTING.md on its own, so this page pulls it in.
Links written for GitHub are rewritten for the site below.
{% endcomment %}
{% capture guide %}{% include_relative CONTRIBUTING.md %}{% endcapture %}
{% assign contributors_url = '/CONTRIBUTORS.html' | relative_url %}
{% assign license_url = 'https://github.com/' | append: site.repository | append: '/blob/master/LICENSE' %}
{{ guide | replace: '](CONTRIBUTORS.md)', '](CONTRIBUTORS_URL)' | replace: '](LICENSE)', '](LICENSE_URL)' | replace: 'CONTRIBUTORS_URL', contributors_url | replace: 'LICENSE_URL', license_url }}
