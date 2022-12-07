# This installs jenkins using a helm chart

function get_password() {
    kubectl exec --namespace jenkins -it svc/jenkins -c jenkins -- /bin/cat /run/secrets/additional/chart-admin-password && echo -n jenkins
}

function install() {
    sudo helm repo add jenkinsci https://charts.jenkins.io
    sudo helm repo update
    chart="jenkinsci/jenkins"
    sudo helm install jenkins -n jenkins -f jenkins-values.yaml $chart
}

function uninstall() {
    helm uninstall jenkins -n jenkinsci/jenkins
}

function upgrade() {
    helm upgrade -f jenkins-values.yaml jenkins jenkinsci/jenkins
}
