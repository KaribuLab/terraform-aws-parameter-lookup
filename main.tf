data "aws_ssm_parameters_by_path" "parameters" {
  path            = var.base_path
  recursive       = true
  with_decryption = true
}

locals {
  parameters = zipmap(
    data.aws_ssm_parameters_by_path.parameters.names,
    data.aws_ssm_parameters_by_path.parameters.values
  )
}
