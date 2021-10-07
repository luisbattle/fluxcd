# Install FLUXCD
    https://fluxcd.io/docs/installation/

# Flux CLI
curl -s https://fluxcd.io/install.sh | sudo bash
. <(flux completion bash)

flux bootstrap git \
  --url=git@bitbucket.org:lbatalla/helm-charts.git \
  --branch=main \
  --path=fluxcd/flux-system \
  --private-key-file=/home/lbatalla.ssh/id_rsa


## Crear ssh key para BitBucket
kubectl create secret generic flux-git-deploy --from-file=identity=/mnt/c/repos/iac_k8s_cluster/fluxcd/id_rsa -n flux-system

## Create a GitRepository object on your cluster by specifying the SSH address of your repo:
flux create source git flux-system \
  --git-implementation=libgit2 \
  --url=ssh://git@bitbucket.org:lbatalla/helm-charts.git \
  --branch=main \
  --ssh-key-algorithm=rsa \
  --ssh-rsa-bits=4096 \
  --interval=1m

helm upgrade -i flux fluxcd/flux --wait \
--namespace fluxcd \
--set git.url=git@github.com:luisbattle/helm-charts.git \
--set git.branch=main \
--set git.path="release/prod\,init"