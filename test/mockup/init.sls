# Mockup states that are a part of other formulas but required for the test
# environment to work properly

{% from "filebeat/map.jinja" import filebeat with context %}

filebeat_mockup_deps:
  pkg.installed:
    - pkgs:
      - haveged

{% if salt['grains.get']('os_family') == 'Debian' %}
stretch_backports_repo_managed:
  pkgrepo.managed:
    - humanname: Stretch Backports
    - name: deb http://ftp.debian.org/debian stretch-backports main
    - file: /etc/apt/sources.list.d/stretch-backports.list
{% endif %}
