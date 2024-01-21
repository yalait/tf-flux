<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.6 |
| <a name="requirement_flux"></a> [flux](#requirement\_flux) | >= 1.1.2 |
| <a name="requirement_github"></a> [github](#requirement\_github) | >= 5.42.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | >= 2.20.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_flux"></a> [flux](#provider\_flux) | 1.2.2 |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | 2.25.2 |

## Resources

| Name | Type |
|------|------|
| [flux_bootstrap_git.flux](https://registry.terraform.io/providers/fluxcd/flux/latest/docs/resources/bootstrap_git) | resource |
| [kubernetes_namespace.flux](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |
| [kubernetes_secret_v1.sops-age](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/secret_v1) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_flux_agekey"></a> [flux\_agekey](#input\_flux\_agekey) | Flux to agekey path | `string` | `"/home/yagami/age.agekey"` | no |
| <a name="input_flux_cluster_domain"></a> [flux\_cluster\_domain](#input\_flux\_cluster\_domain) | Cluster domain name | `string` | `"cluster.local"` | no |
| <a name="input_flux_components"></a> [flux\_components](#input\_flux\_components) | Flux components | `list(string)` | ```[ "source-controller", "kustomize-controller", "helm-controller", "notification-controller" ]``` | no |
| <a name="input_flux_components_extra"></a> [flux\_components\_extra](#input\_flux\_components\_extra) | Flux extra components | `set(string)` | ```[ "image-reflector-controller", "image-automation-controller" ]``` | no |
| <a name="input_flux_log_level"></a> [flux\_log\_level](#input\_flux\_log\_level) | Flux log level | `string` | `"info"` | no |
| <a name="input_flux_namespace"></a> [flux\_namespace](#input\_flux\_namespace) | Name namespace flux | `string` | `"flux-system"` | no |
| <a name="input_flux_path"></a> [flux\_path](#input\_flux\_path) | Path to bootstrap config for flux | `string` | `"clusters/base"` | no |
| <a name="input_flux_version"></a> [flux\_version](#input\_flux\_version) | Flux version | `string` | `"latest"` | no |
| <a name="input_flux_watch_all_namespaces"></a> [flux\_watch\_all\_namespaces](#input\_flux\_watch\_all\_namespaces) | Flux watch all namespaces | `bool` | `true` | no |
<!-- END_TF_DOCS -->