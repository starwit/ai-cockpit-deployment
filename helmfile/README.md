# Helmfiles

## Cloud demo / dev setup (`helmfile.yaml`)

## Exhibition end-to-end demo (`end-to-end-demo.yaml`)
### How to reset
```sh
# Truncate database table "decision"
kubectl exec aicockpit-postgresql-0 -- sh -c "export PGPASSWORD=aicockpit; psql -U aicockpit -c 'truncate decision cascade;'"

# Clear minio bucket "anomalies"
kubectl exec $(kubectl get pods -l app.kubernetes.io/name=minio -o jsonpath="{.items[0].metadata.name}") -- sh -c "mc alias set local http://localhost:9000 minioadmin minioadmin;mc rm --recursive --force local/anomalies"
```