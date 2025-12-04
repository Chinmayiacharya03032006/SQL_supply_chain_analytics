drop table if exists fact_act_est;

-- Create a helper table(fact_act_est)
-- Creating table by combining Sales & Forecast

create table fact_act_est
(
     select 
            s.date as date,
            s.fiscal_year as fiscal_year,
            s.product_code as product_code,
            s.customer_code as customer_code,
            s.sold_quantity as sold_quantity,
            f.forecast_quantity as forecast_quantity
     from fact_sales_monthly s
     left join fact_forecast_monthly f 
     using (date, customer_code, product_code)
)
union
(
     select 
            f.date as date,
            f.fiscal_year as fiscal_year,
            f.product_code as product_code,
            f.customer_code as customer_code,
            s.sold_quantity as sold_quantity,
            f.forecast_quantity as forecast_quantity
     from fact_forecast_monthly f
     left join fact_sales_monthly s 
     using (date, customer_code, product_code)
);

-- Replace NULL values with 0

SET SQL_SAFE_UPDATES = 0;

UPDATE fact_act_est 
SET sold_quantity = 0 
WHERE sold_quantity IS NULL;

SET SQL_SAFE_UPDATES = 1;   -- turn it back on


-- 🔹 Module 2: Database Triggers
-- Trigger for Sales

DELIMITER $$

CREATE TRIGGER fact_sales_monthly_AFTER_INSERT 
AFTER INSERT ON fact_sales_monthly 
FOR EACH ROW 
BEGIN
    INSERT INTO fact_act_est 
        (date, product_code, customer_code, sold_quantity)
    VALUES 
        (NEW.date, NEW.product_code, NEW.customer_code, NEW.sold_quantity)
    ON DUPLICATE KEY UPDATE
        sold_quantity = VALUES(sold_quantity);
END $$

DELIMITER ;

-- After creating the trigger, test it by inserting a record:

insert into fact_sales_monthly
(date, product_code, customer_code, sold_quantity)
values 
("2030-09-01", "HAHA", 99, 89);

-- Then verify:
select * from fact_act_est where customer_code = 99;


-- Trigger for Forecast Table

DELIMITER $$

CREATE TRIGGER fact_forecast_monthly_AFTER_INSERT
AFTER INSERT ON fact_forecast_monthly
FOR EACH ROW
BEGIN
    INSERT INTO fact_act_est (date, product_code, customer_code, forecast_quantity)
    VALUES (NEW.date, NEW.product_code, NEW.customer_code, NEW.forecast_quantity)
    ON DUPLICATE KEY UPDATE forecast_quantity = VALUES(forecast_quantity);
END $$

DELIMITER ;

-- Testing


UPDATE fact_sales_monthly
SET sold_quantity = 89
WHERE date = '2030-09-01'
  AND product_code = 'HAHA'
  AND customer_code = 99;
  
  
UPDATE fact_sales_monthly
SET sold_quantity = 43
WHERE date = '2030-09-01'
  AND product_code = 'HAHA'
  AND customer_code = 99;
select * from fact_act_est where customer_code = 99;


