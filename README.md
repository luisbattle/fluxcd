
export GITHUB_TOKEN=

flux-system flux bootstrap \
github \
--owner luisbattle \
--repository fluxcd \
--personal \
--path fluxcd/flux-system \
--branch master
► connecting to github.com
► cloning branch "master" from Git repository "https://github.com/luisbattle/fluxcd.git"
✔ cloned repository
► generating component manifests
✔ generated component manifests
✔ committed sync manifests to "master" ("59d666b2b4d9706f729db09b9d383b6865f253ad")
► pushing component manifests to "https://github.com/luisbattle/fluxcd.git"
► installing components in "flux-system" namespace
✔ installed components
✔ reconciled components
► determining if source secret "flux-system/flux-system" exists
► generating source secret
✔ public key: ssh-rsa xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
✔ configured deploy key "flux-system-master-flux-system-./fluxcd/flux-system" for "https://github.com/luisbattle/fluxcd"
► applying source secret "flux-system/flux-system"
✔ reconciled source secret
► generating sync manifests
✔ generated sync manifests
✔ committed sync manifests to "master" ("1f18888fe8cd3d65c18d4c978222624e621950f7")
► pushing sync manifests to "https://github.com/luisbattle/fluxcd.git"
► applying sync manifests
✔ reconciled sync configuration
◎ waiting for Kustomization "flux-system/flux-system" to be reconciled
✔ Kustomization reconciled successfully
► confirming components are healthy
✔ helm-controller: deployment ready
✔ kustomize-controller: deployment ready
✔ notification-controller: deployment ready
✔ source-controller: deployment ready
✔ all components are healthy
➜  flux-system

