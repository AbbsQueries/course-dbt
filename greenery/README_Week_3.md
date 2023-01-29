
# PART 1
Q1: What is our conversion Rate?
- Answer:  0.46

- File: _total_product_conversion

Q2: What is our conversion Rate by Product?

File: Results can be found _int_product_conversion


# PART 5: Snapshot - Which orders changed from week 2 to week 3? 

- Answer: These are the orders that changed from Week 2 to Week 3:
 c0873253-7827-4831-aa92-19c38372e58d, 29d20dcd-d0c4-4bca-a52d-fc9363b5d7c6, e2729b7d-e313-4a6f-9444-f7f65ae8db9a


 - File:          
select order_id
from DEV_DB.DBT_ABIGAILDEVSEZE.SNAPSHOT_ORDERS
where dbt_valid_to::date = '2023-01-26'
