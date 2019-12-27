# Exercise 9 - Backend

In this exercise we will explore how to use terraform backend configuration to keep tfstate file save.

1. Create S3 bucket, it can be done manually or by simply terraform code.
2. In root directory add backend.tf file with terraform backend definition. Use bucket created earlier.
3. Run terraform init - review information about backend
4. Validate code and apply.

From this moment infrastructure state is kept in remote location.
