# 輸出 EKS Cluster name
output "cluster_name" {
  description = "Amazon Web Service EKS Cluster Name"
  value       = module.eks.cluster_name
  # 從 module.eks 取得 cluster_name
  # 用於其他 module 或 pipeline 參考 Cluster 名稱
}

# 輸出 EKS Cluster API endpoint
output "cluster_endpoint" {
  description = "Endpoint for Amazon Web Service EKS"
  value       = module.eks.cluster_endpoint
  # 從 module.eks 取得 cluster_endpoint
  # 可用於 kubectl 或 Kubernetes provider 設定
}

# 輸出 AWS region
output "region" {
  description = "Amazon Web Service EKS Cluster region"
  value       = var.region
  # 從 variable region 取得，用於 Provider 或其他 module
}

# 輸出 EKS Cluster 的 Security Group ID
output "cluster_security_group_id" {
  description = "Security group ID for the Amazon Web Service EKS Cluster"
  value       = module.eks.cluster_security_group_id
  # 從 module.eks 取得 cluster 的 security group ID
  # 可用於設定 Node Group 或其他資源的安全規則
}
