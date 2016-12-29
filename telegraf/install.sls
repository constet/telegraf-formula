{% from "telegraf/map.jinja" import telegraf with context %}

telegraf-repo:
  file.managed:
    - name: {{ telegraf.repo_target }}/influxdata.repo
    - source: salt://telegraf/files/{{ telegraf.repo_file }}
    - user: root
    - group: root
    - mode: 644

telegraf-install:
  pkg.installed:
    - name: {{ telegraf.pkg_name }}
    - require:
      - file: telegraf-repo
