# The image an Actions run pushes into Pipemesh's registry (DESIGN-V142):
# Debian with bash, git, curl and tar, so a hosted job can run in it.
FROM docker.io/library/buildpack-deps:bookworm-scm@sha256:5bac6b3020afcf0358de87990605d5dc4c3f060629381912266b9b9278375af3
ARG REVISION=unknown
RUN printf 'built on GitHub Actions at %s\n' "$REVISION" > /pipemesh-demo.txt
