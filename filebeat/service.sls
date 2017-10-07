# -*- coding: utf-8 -*-
# vim: ft=sls
{% from "filebeat/map.jinja" import filebeat with context %}

filebeat_service:
  service.running:
    - name: filebeat
    - enable: True
    - watch:
      - file: filebeat_config
