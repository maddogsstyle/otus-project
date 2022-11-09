{{- define "rabbitmq-exporter.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name}}
{{- end -}}
