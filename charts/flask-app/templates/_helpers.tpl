{{/*
Return the chart name
*/}}
{{- define "flask-app.name" -}}
{{ .Chart.Name }}
{{- end }}

{{/*
Return a fullname using chart and release
*/}}
{{- define "flask-app.fullname" -}}
{{- printf "%s-%s" .Chart.Name .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{/*
Standard labels for metadata
*/}}
{{- define "flask-app.labels" -}}
app.kubernetes.io/name: {{ .Chart.Name }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: "{{ .Chart.AppVersion }}"
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels (for selectors in deployments and services)
*/}}
{{- define "flask-app.selectorLabels" -}}
app.kubernetes.io/name: {{ .Chart.Name }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Generate a service account name
*/}}
{{- define "flask-app.serviceAccountName" -}}
{{- if .Values.serviceAccount.name }}
{{- .Values.serviceAccount.name }}
{{- else }}
{{- include "flask-app.fullname" . }}
{{- end }}
{{- end }}

