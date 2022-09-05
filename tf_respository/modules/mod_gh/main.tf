resource "github_repository" "example" {
  name        = var.repository_name
  description = "terraform example"
  visibility  = "public"
  auto_init   = true
}
resource "github_repository_file" "example_file" {
  repository          = github_repository.example.name
  branch              = var.main_branch
  file                = "README.md"
  content             = <<EOF
    ### Author: oscar campos
  EOF
  commit_message      = "Managed by Terraform"
  overwrite_on_create = true
}

resource "github_branch" "example_branch_stage" {
  repository          = github_repository.example.name
  branch = "stage"
  source_branch = var.main_branch
}

resource "github_branch" "example_branch_dev" {
  repository          = github_repository.example.name
  branch = "development"
  source_branch = github_branch.example_branch_stage.branch
}

resource "github_branch_default" "branch_default" {
  repository          = github_repository.example.name
  branch = github_branch.example_branch_dev.branch
}