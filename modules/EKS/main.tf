resource "aws_iam_role" "eks_cluster" {
    name = var.cluster_name

    tags = {
        Name = var.cluster_name
    }
  assume_role_policy = <<POLICY
  {
    "version" : "2023-04-16",
    "Statement": [
        {
            "Effect": "Allow"
            "Principle" : {
                "Service : "eks.amazon.com"
            },
            "Action" : "sts:AssumeRole"
            
        }
    ]
  }
  POLICY

  
}

resource "aws_iam_role_policy_attachment" "AmazonEKSClusterPolicy" {
    policy_arn  = "arn:aws:iam::691575244851:role/EKS-Cluster"
    role = aws_iam_role.eks_cluster.name

  
}

resource "aws_iam_role_policy_attachment" "AmazonEKSServicePolicy" {
    policy_arn  = "arn:aws:iam::691575244851:role/aws-service-role/eks.amazonaws.com/AWSServiceRoleForAmazonEKS"
    role = aws_iam_role.eks_cluster.name
  
}

resource "aws_eks_cluster" "aws_eks" {
    name = aws_iam_role.eks_cluster.name
    role_arn = aws_iam_role.eks_cluster.arn

    vpc_config {
        subnet_ids = ["subnet-0925b04d79caa625a","subnet-0adf449365f26d140"]

      
    }
    tags = {
      Name = aws_iam_role.eks_cluster.name
    }

  
}

resource "aws_iam_policy_attachment" "AmazonEKSWorkerNodePolicy" {
    policy_arn = "arn:aws:iam::691575244851:role/aws-service-role/eks-nodegroup.amazonaws.com/AWSServiceRoleForAmazonEKSNodegroup"
    roles = aws_iam_role.eks_nodes.name
    name = aws_iam_role.eks_cluster.name
  
}

resource "aws_iam_role_policy_attachment" "AmazonEKS_CNI_Policy" {
    policy_arn = "arn:aws:iam::691575244851:role/EKS"
    role = aws_iam_role.eks_nodes.name
  
}

resource "aws_iam_role_policy_attachment" "AmazonEC2ContainerRegistryReadOnly" {
    policy_arn = "arn:aws:iam::691575244851:role/aws-service-role/replication.ecr.amazonaws.com/AWSServiceRoleForECRReplication"
    
  
}

resource "aws_eks_node_group" "node" {
    cluster_name = aws_eks_cluster.aws_eks.name
    node_group_name = aws_iam_role.eks_nodes.Name
    node_role_arn = aws_iam_role.eks_nodes.role_arn
    subnets_ids = ["subnet-0925b04d79caa625a","subnet-0adf449365f26d140"]
    tags = {
        Name = aws_iam_role.eks_cluster.cluster_name
    }
  
  scaling_config {
    desired_size = 3
    max_size = 5
    min_size = 3
  }
}