workflow "Pack on push" {
  on = "push"
  resolves = ["elstudio/actions-js-build/commit@master"]
}

action "GitHub Action for npm" {
  uses = "actions/npm@3c8332795d5443adc712d30fa147db61fd520b5a"
  args = "run dist"
}

action "elstudio/actions-js-build/commit@master" {
  uses = "elstudio/actions-js-build/commit@master"
  needs = ["GitHub Action for npm"]
  secrets = ["GITHUB_TOKEN"]
  env = {
    WD_PATH = "./dist"
  }
}
