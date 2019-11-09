# Exercise 4.1 - variables

In this exercise we will explore terraform variables loading order.

1. Edit main.tf file.
2. Create variables for region and bucket.
3. Run init and plan.
4. Create environment variable TF_VAR_bucket with bucket_name_1.
5. Run plan.
6. Create terraform.tfvars file with bucket_name_2.
7. Run plan.
8. Create bucket.auto.tfvars file with bucket_name_3.
9. Run plan.
10. Run plan with -var flag and bucket_name_4.

Each time we run plan; bucket should have different name.
