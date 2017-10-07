# -*- coding: utf-8 -*-
# vim: ft=sls
{% from "filebeat/map.jinja" import filebeat with context %}

filebeat_config:
  file.managed:
    - name: '/etc/filebeat/filebeat.yml'
    - source: salt://filebeat/files/filebeat.yml.j2
    - user: root
    - group : root
    - mode: 0640
    - template: jinja
