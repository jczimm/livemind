workflow "Pack on push" {
  on = "push"
  resolves = ["Commit to Repo"]
}

action "Install Deps" {
  uses = "actions/npm@3c8332795d5443adc712d30fa147db61fd520b5a"
  args = "install"
}

action "Build" {
  uses = "actions/npm@3c8332795d5443adc712d30fa147db61fd520b5a"
  args = "run dist"
  needs = ["Install Deps"]
}

action "Commit to Repo" {
  uses = "elstudio/actions-js-build/commit@master"
  secrets = ["GITHUB_TOKEN"]
  env = {
    WD_PATH = "./dist"
  }
  needs = ["Build"]
}
