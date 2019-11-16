# Exercise 3.5 - random resources continued

In this exercise we will use random_integer, random_string and random_pet to create buckets names.

1. Edit main.tf file.
2. Uncoment random_integer resource and add missing attributes.
3. Modify bucket_1 bucket attribute to be using random_integer id as a name.
4. Modify bucket_2 bucket attribute to be using random_pet id as a name.
5. Uncoment random_string resource and add missing attributes.
6. Modify bucket_3 bucket attribute to be using random_string result as a name.
7. Run terraform init.
8. Run terraform plan.
9. Run terraform apply.

Terraform will create 3 S3 buckets with random names genereted by 3 different resources.
