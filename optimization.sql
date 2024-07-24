/* Get amount of orders and clients relating to products. */

-- Bad example

explain analyze select p_name, COUNT(orders_clients.o_id), COUNT(orders_clients.c_id) from
(select p_name, o.order_id as o_id, c.id as c_id from
(select p.product_id as p_id, p.product_name as p_name from opt_products as p) as product
JOIN opt_orders o on o.product_id = product.p_id
JOIN opt_db.opt_clients c on c.id = o.client_id) as orders_clients
GROUP BY p_name;


-- Good example
CREATE INDEX idx_opt_product_name
    ON opt_db.opt_products(product_name);
