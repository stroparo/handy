:: Convert docker-compose to k8s/openshift:
cmd /C scoop install kompose
cmd /C scoop install krew
cmd /C scoop install kubeadm
cmd /C scoop install kubectl
cmd /C scoop install kubectx
cmd /C scoop install kubefwd
cmd /C scoop install kubens
cmd /C scoop install kubescape
cmd /C scoop install kubeseal
cmd /C scoop install kubeval
cmd /C scoop install kustomize
:: Verify deprecated apiVersions K8s/Helm:
cmd /C scoop install pluto

:: Dev - containers - K8s managers:
cmd /C scoop install k9s
cmd /C scoop install kops
cmd /C scoop install loft
cmd /C scoop install minikube

:: Local Services
cmd /C scoop install etcd
cmd /C scoop install miniserve
