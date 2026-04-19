-- Databricks notebook source
---1. Classify each product by price: ● 'Expensive' if price > 1000 ● 'Mid-range' if price between 100 and 1000 ● 'Budget' if price < 100

select * from brightlearn.databases.excerise_3_products;

select product_name,
        price,
case 
     when cast(price as double) > 1000 then 'Expensive'
     when cast(price as double) between 100 and 1000 then 'Mid-range'
     else 'Bugdet'
     end as price_category
from brightlearn.databases.excerise_3_products;

---2. Label each order: ● 'High Value' for orders ≥ 1000 ● 'Medium Value' for 500–999.99 ● 'Low Value' for orders < 500

select * from brightlearn.databases.excerise_3_orders;
select customer_name,
       amount,
case 
    when cast (amount as double) >= 1000 then 'High Value'
    when cast (amount as double) between 500 and 999.99 then 'Medium Value'
    else 'low Value'
    end as order_value_category
from brightlearn.databases.excerise_3_orders;

---3. Categorize employee position: ● If in 'IT' and salary > 80000 → 'Senior IT' ● If in 'HR' and salary > 55000 → 'Experienced HR' ● Otherwise → 'Staff'

select * from brightlearn.databases.excerise_3_employees;

select emp_name,
       department,
       salary,
case
    when department='IT' and salary>80000 then 'Senior IT'
    when department='HR' and salary>55000 then 'Experienced HR'
    else 'Staff'
    end as position_level
from brightlearn.databases.excerise_3_employees;

---4. Assign a letter grade: ● ≥ 90: 'A' ● 80–89: 'B' ● 70–79: 'C' ● 60–69: 'D' ● < 60: 'F'

select * from brightlearn.databases.excerise_3_students;

select student_name,
       score,
case
   when score >=90 then 'A' 
   when score between 80 and 89 then 'B'
   when score between 70 and 79 then 'C'
   when score between 60 and 69 then 'D'
   else 'F'
   end as grade
from brightlearn.databases.excerise_3_students;

---5. Label delivery performance: ● ≤ 30 mins: 'Fast' ● 31–60 mins: 'On Time' ● 60 mins: 'Late'

select * from brightlearn.databases.excerise_3_deliveries;

select delivery_id,
       delivery_time_minutes,
case 
    when delivery_time_minutes <=30 then 'fast'
    when delivery_time_minutes between 31 and 60 then 'On Time'
    else 'Late'
    end as perfomance
from brightlearn.databases.excerise_3_deliveries;

--6. Convert priority to labels: ● 3 → 'High' ● 2 → 'Medium' ● 1 → 'Low'

select * from brightlearn.databases.excerise_3_tickets;

select issue_type,
       priority,
case
    when priority = 3 then 'high'
    when priority = 2 then 'Medium'
    else 'low'
    end as priority_label
from brightlearn.databases.excerise_3_tickets;

---7. Calculate attendance % and classify: ● ≥ 90% → 'Excellent' ● 75–89% → 'Good' ● < 75% → 'Needs Improvement'

select * from brightlearn.databases.excerise_3_attendance;

select student_id,
      (days_present/total_days)*100 as attendance_percentage,
case
    when attendance_percentage >= 90 then 'Excellent'
    when attendance_percentage between 75 and 89 then 'Good'
    else 'Needs Improvement'
    end as attendance_status
from brightlearn.databases.excerise_3_attendance;

---8. Label stock status: ● 0 → 'Out of Stock' ● 1–5 → 'Low Stock' ● 5 → 'In Stock'

select * from brightlearn.databases.excerise_3_products_inventory;

select product_id,
       stock_qty,
case
    when stock_qty =0 then 'Out of stock'
    when stock_qty between 1 and 5 then 'Low Stock'
    else 'In stock'
    end as stock_status
from brightlearn.databases.excerise_3_products_inventory;

---9. Classify by size: ● ≥ 25 → 'Large' ● 10–24 → 'Medium' ● < 10 → 'Small'

select * from brightlearn.databases.excerise_3_classes;

select subject,
       enrolled_students,
case
    when enrolled_students>= 25 then 'Large'
    when enrolled_students between 10 and 24 then 'Medium'
    else 'Small'
    end as class_size_category
from brightlearn.databases.excerise_3_classes;


---10. Apply discount flag: ● If payment_method = 'Cash' and amount ≥ 200 → 'Eligible for Discount' ● Otherwise → 'Not Eligible'

select * from brightlearn.databases.excerise_3_payments;

select payment_id, 
       amount,
       payment_method,
case
    when payment_method = 'Cash' and cast(amount as double)>= 200 then 'Eligible for Discount'
    else 'Not Eligible'
    end as discount_eligibility
from brightlearn.databases.excerise_3_payments;



