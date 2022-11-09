{{- define "mongodb-exporter.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name}}
{{- end -}}
