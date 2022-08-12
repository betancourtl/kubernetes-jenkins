# This installs jenkins using a helm chart

function get_password() {
    kubectl exec --namespace jenkins -it svc/jenkins -c jenkins -- /bin/cat /run/secrets/additional/chart-admin-password && echo -n jenkins
}

function install() {
    helm install jenkins -n jenkins -f 05-values.yaml $chart
}

function uninstall() {
    helm uninstall jenkinsci -n jenkins
}
