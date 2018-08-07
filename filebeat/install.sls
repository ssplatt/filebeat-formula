# -*- coding: utf-8 -*-
# vim: ft=sls
# How to install filebeat
{%- from "filebeat/map.jinja" import filebeat with context %}

{% if filebeat.repo_managed %}
filebeat_pkgrepo:
  pkgrepo.managed:
{% if salt['grains.get']('os_family') == 'Debian' %}
    - name: deb https://artifacts.elastic.co/packages/{{ filebeat.major_version }}.x/apt stable main
    - file: /etc/apt/sources.list.d/elastic-{{ filebeat.major_version }}.x.list
    - key_url: https://artifacts.elastic.co/GPG-KEY-elasticsearch
{% elif salt['grains.get']('os_family') == 'RedHat' %}
    - name: elastic-{{ filebeat.major_version }}.x
    - baseurl: https://artifacts.elastic.co/packages/{{ filebeat.major_version }}.x/yum
    - gpgkey: https://packages.elastic.co/GPG-KEY-elasticsearch
{% endif %}
    - humanname: Elastic Repository
    - gpgcheck: 1
    - require_in:
      - pkg: {{ filebeat.pkg }}
    - watch_in:
      - pkg: {{ filebeat.pkg }}
{% endif %}

filebeat_pkg:
  pkg.installed:
    - name: {{ filebeat.pkg }}
