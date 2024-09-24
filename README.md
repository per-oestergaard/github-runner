# github-runner
Github runner that runs in docker so it is isolated

## Example
```bash
export RUNNER_REPO_URL=https://github.com/per-oestergaard/repo-name
export RUNNER_TOKEN=the-token
docker run -e RUNNER_REPO_URL -e RUNNER_TOKEN github-runner
```
