module "argocd-bootstrap" {
  source = "github.com/cloud-native-toolkit/terraform-tools-argocd-bootstrap?ref=v1.12.0"

  cluster_type        = module.dev_cluster.platform.type_code
  ingress_subdomain   = module.dev_cluster.platform.ingress
  cluster_config_file = module.dev_cluster.config_file_path
  olm_namespace       = module.dev_software_olm.olm_namespace
  operator_namespace  = module.dev_software_olm.target_namespace
  gitops_repo_url     = module.gitops.config_repo_url
  git_username        = module.gitops.config_username
  git_token           = module.gitops.config_token
  bootstrap_path      = module.gitops.bootstrap_path
  sealed_secret_cert  = module.cert.cert
  sealed_secret_private_key = module.cert.private_key
  create_webhook      = false
}