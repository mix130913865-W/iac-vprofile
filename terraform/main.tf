# Kubernetes Provider 設定
provider "kubernetes" {
  host                   = module.eks.cluster_endpoint
  cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
  # host: 從 module.eks 的 cluster_endpoint 取得 Kubernetes Cluster API endpoint
  # cluster_ca_certificate: 從 module.eks 的 cluster_certificate_authority_data 取得 CA certificate
}

# AWS Provider 設定
provider "aws" {
  region = var.region
  # region 從 variable region 取得，指定 AWS 區域
}

# 取得 AWS 可用的 Availability Zones
data "aws_availability_zones" "available" {}
# 用於 Subnet 或 Node Group 配置，可取得 AWS 可用 AZ 列表

# 定義 local 變數
locals {
  cluster_name = var.clusterName
  # local cluster_name 從 variable clusterName 取得，方便 module 與 provider 使用
}
