module "eks" {
  source  = "terraform-aws-modules/eks/aws"  # 使用官方 EKS Terraform module
  version = "19.19.1"                        # 指定 module 版本，確保環境一致

  # Cluster 基本設定
  cluster_name    = local.cluster_name       # EKS Cluster name，從 local 變數取得
  cluster_version = "1.29"                   # Kubernetes version

  # VPC 與 Subnet 設定
  vpc_id     = module.vpc.vpc_id            # 指定已建立的 VPC ID
  subnet_ids = module.vpc.private_subnets   # 使用 VPC 的 private Subnets
  cluster_endpoint_public_access = true     # Cluster API endpoint 是否公開可存取

  # EKS Managed Node Group 預設設定
  eks_managed_node_group_defaults = {
    ami_type = "AL2_x86_64"                 # EC2 AMI type，Amazon Linux 2 x86_64
  }

  # EKS Managed Node Groups 詳細設定
  eks_managed_node_groups = {
    one = {
      name = "node-group-1"                 # Node Group name

      instance_types = ["t3.small"]         # EC2 instance types

      min_size     = 1                       # Auto Scaling 最小 Node 數量
      max_size     = 3                       # Auto Scaling 最大 Node 數量
      desired_size = 2                       # Auto Scaling 預期 Node 數量
    }

    two = {
      name = "node-group-2"                 # Node Group name

      instance_types = ["t3.small"]         # EC2 instance types

      min_size     = 1                       # Auto Scaling 最小 Node 數量
      max_size     = 2                       # Auto Scaling 最大 Node 數量
      desired_size = 1                       # Auto Scaling 預期 Node 數量
    }
  }
}
