module "flux" {
  source            = "github.com/yalait/flux-terraform?ref=main"
  github_owner      = var.github_owner
  github_token      = var.github_token
  github_repository = var.github_repository
  depends_on = [
    module.cp,
    module.dp,
    module.talos,
    module.helm
  ]
}
provider "flux" {
  kubernetes = {
    config_path  = module.talos.kubeconfig_file.filename
    config_paths = [module.talos.kubeconfig_file.filename]
  }
  git = {
    url = "https://github.com/${var.github_owner}/${var.github_repository}.git"
    http = {
      username = var.github_owner
      password = var.github_token
    }
  }
}
provider "kubernetes" {
  config_path    = module.talos.kubeconfig_file.filename
  config_context = var.k8s_context
}
