# ©2026, ANSYS Inc. Unauthorized use, distribution or duplication is prohibited.

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.20"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.12"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.27"
    }
    keycloak = {
      source                = "keycloak/keycloak"
      version               = "~> 4.5"
      configuration_aliases = [keycloak.cluster_access]
    }
  }

  required_version = "~> 1.10"
}

provider "aws" {
  region = var.region
  default_tags {
    tags = merge(var.global_tags, var.default_tags)
  }
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.eks.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.eks.certificate_authority[0].data)
  token                  = data.aws_eks_cluster_auth.eks.token
}

provider "helm" {
  kubernetes {
    host                   = data.aws_eks_cluster.eks.endpoint
    cluster_ca_certificate = base64decode(data.aws_eks_cluster.eks.certificate_authority[0].data)
    token                  = data.aws_eks_cluster_auth.eks.token
  }

  registry {
    url      = "oci://${var.inventory-api_config.registry_name}"
    username = local.acr_pull.username
    password = local.acr_pull.password
  }
}

provider "keycloak" {
  client_id     = local.kc_credentials["client_id"]
  client_secret = local.kc_credentials["client_secret"]
  realm         = var.inventory-api_config.realm_name
  url           = "https://${local.ansys_iam_domain}"
  base_path     = trimsuffix(var.inventory-api_config.base_path, "/")
}

# Cluster Access keycloak (infra keycloak for cluster access)
provider "keycloak" {
  alias         = "cluster_access"
  client_id     = local.tf_service_account_secret["client_id"]
  client_secret = local.tf_service_account_secret["client_secret"]
  realm         = local.tf_service_account_secret["realm"]
  url           = "https://${local.tf_service_account_secret["url"]}"
  base_path     = trimsuffix(var.inventory-api_config.base_path, "/")
}
