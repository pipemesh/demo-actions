# demo-actions

A Pipemesh dogfood repository for **GitHub Actions as an executor**: the
pipeline in `pipemesh.yaml` builds through `.github/workflows/build.yml`
(a `kind: build` with `github_actions:`; its `dist` artifact is imported
into Pipemesh), verifies that artifact on Pipemesh's hosted compute, and
then runs `deploy_staging` and `deploy_prod`, each a `kind: deploy`, as
`workflow_dispatch` runs of `.github/workflows/deploy.yml`. Pipemesh
orchestrates the release — stages, promotion, supersede — and Actions
provides the compute. Each Actions job's checkout is read from its
workflow file (both check out the whole revision).

Nothing here is real software: `app/` is a version file and two scripts.
