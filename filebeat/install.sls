# -*- coding: utf-8 -*-
# vim: ft=sls
# How to install filebeat
{%- from "filebeat/map.jinja" import filebeat with context %}

filebeat_pkg:
  pkg.installed:
    - name: {{ filebeat.pkg }}
