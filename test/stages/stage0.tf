terraform {
  required_providers {
    gitops = {
      source = "cloud-native-toolkit/gitops"
    }
   ibm = {
      source = "ibm-cloud/ibm"
    }
  }
}

module setup_test_clis {
  source = "github.com/cloud-native-toolkit/terraform-util-clis.git"

  bin_dir = "${path.cwd}/test_bin_dir"
  clis = ["kubectl", "oc"]
}

resource local_file bin_dir {
  filename = "${path.cwd}/.bin_dir"

  content = module.setup_test_clis.bin_dir
}

locals {
  name_prefix_test = "${var.name_prefix}-${random_string.this.result}"
}

resource "random_string" "this" {
  length = 4
  special = false
  upper = false
}