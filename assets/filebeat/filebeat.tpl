{{range .configList}}
- type: container
  enabled: true
  paths:
      - {{ .HostDir }}/{{ .File }}
  scan_frequency: 10s
  fields_under_root: true
  {{if eq .Format "json"}}
  json.keys_under_root: true
  json.overwrite_keys: true
  {{end}}
  fields:
      {{range $key, $value := .CustomFields}}
      {{ $key }}: {{ $value }}
      {{end}}
      {{range $key, $value := .Tags}}
      {{if ne $key "index"}}
      {{ $key }}: {{ $value }}
      {{end}}
      {{end}}
      {{range $key, $value := $.container}}
      {{ $key }}: {{ $value }}
      {{end}}
  {{range $key, $value := .CustomConfigs}}
  {{ $key }}: {{ $value }}
  {{end}}
  tail_files: false
  close_inactive: 2h
  close_eof: false
  close_removed: true
  clean_removed: true
  close_renamed: false
  {{range $key, $value := .Tags}}
  {{if eq $key "index"}}
  {{ $key }}: "{{ $value }}-%{+yyyy.MM.dd}"
  {{end}}
  {{end}}
{{end}}
