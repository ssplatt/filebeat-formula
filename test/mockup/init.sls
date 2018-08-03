# Mockup states that are a part of other formulas but required for the test
# environment to work properly

{% from "filebeat/map.jinja" import filebeat with context %}

filebeat_mockup_deps:
  pkg.installed:
    - pkgs:
      - haveged

jessie_backports_repo_managed:
  pkgrepo.managed:
    - humanname: Jessie Backports
    - name: deb http://ftp.debian.org/debian jessie-backports main
    - file: /etc/apt/sources.list.d/jessie-backports.list
