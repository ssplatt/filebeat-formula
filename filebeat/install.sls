# -*- coding: utf-8 -*-
# vim: ft=sls
# How to install filebeat
{%- from "filebeat/map.jinja" import filebeat with context %}

filebeat_pkg:
{% if salt['grains.get']('os_family') == 'Debian' %}
  pkgrepo.managed:
    - name: deb https://artifacts.elastic.co/packages/{{ filebeat.major_version }}.x/apt stable main
    - humanname: Elastic Repository
    - file: /etc/apt/sources.list.d/elastic-{{ filebeat.major_version }}.x.list
    - gpgcheck: 1
    - key_url: https://artifacts.elastic.co/GPG-KEY-elasticsearch
    - require_in:
      - pkg: {{ filebeat.pkg }}
    - watch_in:
      - pkg: {{ filebeat.pkg }}

{% elif salt['grains.get']('os_family') == 'RedHat' %}
  pkgrepo.managed:
    - name: elastic-{{ filebeat.major_version }}.x
    - humanname: Elastic Repository
    - baseurl: https://artifacts.elastic.co/packages/{{ filebeat.major_version }}.x/yum
    - gpgcheck: 1
    - gpgkey: https://packages.elastic.co/GPG-KEY-elasticsearch
    - require_in:
      - pkg: {{ filebeat.pkg }}
    - watch_in:
      - pkg: {{ filebeat.pkg }}
{% endif %}

  pkg.installed:
    - name: {{ filebeat.pkg }}
