#!/bin/sh
# A stand-in test suite: checks the app's files and writes the results as a
# small HTML site (test-report/index.html), which the Build workflow uploads
# as the `test-report` artifact whatever the outcome. Pipemesh imports it as
# the build job's report (reports: in pipemesh.yaml).
set -u
out=test-report
mkdir -p "$out"
passed=0 failed=0 rows=""
check() {
  name=$1; shift
  if "$@" >/dev/null 2>&1; then passed=$((passed + 1)); rows="$rows<tr><td class=ok>pass</td><td>$name</td></tr>"
  else failed=$((failed + 1)); rows="$rows<tr><td class=bad>FAIL</td><td>$name</td></tr>"; fi
}
check "VERSION exists" test -f app/VERSION
check "VERSION is semver" grep -Eq '^[0-9]+\.[0-9]+\.[0-9]+$' app/VERSION
check "build script is POSIX sh" sh -n app/build.sh
check "deploy script is POSIX sh" sh -n app/deploy.sh
check "deploy script needs an environment" sh -c '! sh app/deploy.sh'
total=$((passed + failed))
if [ "$failed" -eq 0 ]; then verdict="All $total tests passed"; else verdict="$failed of $total tests failed"; fi
cat > "$out/index.html" <<HTML
<!doctype html>
<meta charset=utf-8>
<title>demo-actions tests</title>
<style>
  body { font: 15px/1.5 system-ui, sans-serif; margin: 2rem; color: #1f2328 }
  table { border-collapse: collapse } td { padding: .3rem .8rem; border-bottom: 1px solid #d0d7de }
  .ok { color: #1a7f37; font-weight: 600 } .bad { color: #cf222e; font-weight: 600 }
</style>
<h1>$verdict</h1>
<p>demo-actions $(cat app/VERSION 2>/dev/null) · built on GitHub Actions</p>
<table>$rows</table>
HTML
echo "$verdict"
[ "$failed" -eq 0 ]
