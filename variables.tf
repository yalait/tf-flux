variable "flux_namespace" {
  type        = string
  description = "Name namespace flux"
  default     = "flux-system"
}

variable "flux_cluster_domain" {
  type        = string
  description = "Cluster domain name"
  default     = "cluster.local"
}
variable "flux_agekey" {
  type        = string
  description = "Flux to agekey path"
  default     = "/home/yagami/age.agekey"
  sensitive   = true
}
variable "flux_path" {
  type        = string
  description = "Path to bootstrap config for flux"
  default     = "clusters/base"
}
variable "flux_components" {
  type        = list(string)
  description = "Flux components"
  default     = ["source-controller", "kustomize-controller", "helm-controller", "notification-controller"]
  validation {
    condition = alltrue([
      for component in var.flux_components : contains([
        "source-controller",
        "kustomize-controller",
        "helm-controller",
        "notification-controller",
      ], component)
    ])
    error_message = "The components must be one of these: source-controller, kustomize-controller, helm-controller, notification-controller."
  }
}
variable "flux_components_extra" {
  type        = set(string)
  description = "Flux extra components"
  default     = ["image-reflector-controller", "image-automation-controller"]
  validation {
    # Определеят правильные ли строки в списке
    condition = alltrue([
      for component in var.flux_components_extra : contains([
        "image-reflector-controller",
        "image-automation-controller"
      ], component)
    ])
    error_message = "The components must be one of these: image-reflector-controller, image-automation-controller."
  }
}
variable "flux_watch_all_namespaces" {
  type        = bool
  description = "Flux watch all namespaces"
  default     = true
}
variable "flux_log_level" {
  type        = string
  description = "Flux log level"
  default     = "info"
}
variable "flux_version" {
  type        = string
  description = "Flux version"
  default     = "latest"
}
