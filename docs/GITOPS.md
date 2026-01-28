# Configuration GitOps avec ArgoCD

## Installation d'ArgoCD

```bash
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
```

## Accès à l'interface ArgoCD

```bash
kubectl port-forward svc/argocd-server -n argocd 8080:443
```

Mot de passe admin initial:
```bash
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
```

## Configuration

1. Modifier `argocd/applications.yaml` avec votre URL de repository GitHub
2. Appliquer les applications:

```bash
kubectl apply -f argocd/applications.yaml
```

## Workflow GitOps

1. **Développement**: Modifier le code dans votre repository
2. **CI/CD**: GitHub Actions construit et pousse les images Docker
3. **GitOps**: ArgoCD détecte les changements et déploie automatiquement
4. **Monitoring**: Prometheus surveille les déploiements

## Avantages

- ✅ Déploiements automatiques
- ✅ Rollback facile
- ✅ Audit complet des changements
- ✅ Synchronisation continue
- ✅ Auto-healing
