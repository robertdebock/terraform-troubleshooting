variable "round" {
  default = "one"
  type    = string
}

locals {
  _who = {
    one   = "me"
    two   = "you"
    three = "us"
  }
  who = local._who[var.round]
}

resource "null_resource" "default" {
  provisioner "local-exec" {
    command = "echo $VARIABLE1 >> debug.txt ; echo $VARIABLE2 >> debug.txt"

    environment = {
        VARIABLE1 = jsonencode(var.round)
        VARIABLE2 = jsonencode(local.who)
    }
  }
}
