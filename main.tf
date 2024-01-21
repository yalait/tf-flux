resource "kubernetes_namespace" "flux" {
  metadata {
    name = var.flux_namespace
  }
}
resource "kubernetes_secret_v1" "sops-age" {
  metadata {
    name      = "sops-age"
    namespace = var.flux_namespace
  }
  data = {
    "age.agekey" = file(var.flux_agekey)
  }
  type       = "Opaque"
  depends_on = [kubernetes_namespace.flux]
}
resource "flux_bootstrap_git" "flux" {
  cluster_domain       = var.flux_cluster_domain
  namespace            = var.flux_namespace
  components           = var.flux_components
  components_extra     = var.flux_components_extra
  version              = var.flux_version == "" ? var.flux_version : null
  log_level            = var.flux_log_level
  path                 = var.flux_path
  watch_all_namespaces = var.flux_watch_all_namespaces
  depends_on           = [kubernetes_secret_v1.sops-age]
}
