# Exercise 4.2 - list and map

In this exercise we will learn how to use lists and maps.

1. Edit main.tf file.
2. Create list of strings with tree bucket names.
3. Replace hard coded bucket names with references to values in list.
4. Create string map with environments and assigned regions to them. For example: dev = eu-west-1, qa = eu-west-2, prod = eu-west-3.
5. Create string variable for environment. For example env.
6. Replace region entries, for provider and buckets, with reference to map. As a key, pass environment variable value.
7. Run plan and test output for variabls dev, qa and prod.

Each time we run plan for specific environment, we should see that it will be executed for different region. Bucket names will be taken from the list.
