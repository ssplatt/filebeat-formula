# -*- coding: utf-8 -*-
# vim: ft=yaml

filebeat:
  enabled: true
  repo_managed: true
  config:
    filebeat:
      prospectors:
        - paths:
            - /var/log/*.log
          input_type: log
      registry_file: /var/lib/filebeat/registry
    logging:
      to_files: true
      to_syslog: false
      files:
        path: /var/log/filebeat
        name: filebeat.log
        keepfiles: 2
    output:
      file:
        path: /tmp/filebeat
        filename: filebeat
