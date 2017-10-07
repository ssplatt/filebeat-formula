# -*- coding: utf-8 -*-
# vim: ft=sls
# Init filebeat
{%- from "filebeat/map.jinja" import filebeat with context %}

{# Below is an example of having a toggle for the state #}
{% if filebeat.enabled %}
include:
  - filebeat.install
  - filebeat.config
  - filebeat.service
{% else %}
'filebeat-formula disabled':
  test.succeed_without_changes
{% endif %}
