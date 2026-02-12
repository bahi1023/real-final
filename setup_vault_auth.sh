#!/bin/bash
if [ -z "$1" ]; then
    echo "Usage: $0 <VAULT_ROOT_TOKEN>"
    exit 1
fi
TOKEN=$1

echo "Configuring Vault with token: $TOKEN"

# 1. Enable K8s Auth
echo "Enabling Kubernetes auth..."
kubectl exec -n bahi vault-0 -- sh -c "VAULT_TOKEN=$TOKEN vault auth enable kubernetes"

# 2. Configure K8s Auth
echo "Writing K8s config..."
kubectl exec -n bahi vault-0 -- sh -c "VAULT_TOKEN=$TOKEN vault write auth/kubernetes/config \
    kubernetes_host='https://\$KUBERNETES_PORT_443_TCP_ADDR:443' \
    token_reviewer_jwt=\"\$(cat /var/run/secrets/kubernetes.io/serviceaccount/token)\" \
    kubernetes_ca_cert=@/var/run/secrets/kubernetes.io/serviceaccount/ca.crt"

# 3. Create Role
echo "Creating role..."
kubectl exec -n bahi vault-0 -- sh -c "VAULT_TOKEN=$TOKEN vault write auth/kubernetes/role/motivational-app \
    bound_service_account_names=motivational-app \
    bound_service_account_namespaces=bahi \
    policies=motivational-app \
    ttl=24h"

echo "Vault configuration complete!"
