# demo-actions

A PipeMesh dogfood repository for **GitHub Actions as job targets**: the
pipeline in `pipemesh.yaml` builds on PipeMesh's hosted compute and then
runs `deploy_staging` and `deploy_prod` as `workflow_dispatch` runs of
`.github/workflows/deploy.yml`. PipeMesh orchestrates the release —
stages, promotion, supersede — and Actions provides the compute.

Nothing here is real software: `app/` is a version file and two scripts.
