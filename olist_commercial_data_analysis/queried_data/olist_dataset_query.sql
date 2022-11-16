SELECT o.order_id, o.order_purchase_timestamp, o.order_estimated_delivery_date, o.order_delivered_customer_date, (o.order_delivered_customer_date - o.order_estimated_delivery_date) AS delivery_lateness,
	   o_r.review_score,
	   c.customer_unique_id, c.customer_city, c.customer_state,
	   s.seller_id, s.seller_city, s.seller_state,
	   o_i.order_item_id, o_i.price, (o_i.order_item_id * o_i.price) AS order_total_price, o_i.freight_value,
	   p.product_id, p.product_category_name, p.product_name_lenght, p.product_description_lenght, p.product_photos_qty
	   
FROM orders AS o

LEFT JOIN order_reviews AS o_r
USING(order_id)

INNER JOIN customers AS c
USING(customer_id)

INNER JOIN order_items AS o_i
USING(order_id)

INNER JOIN sellers AS s
USING(seller_id)

INNER JOIN products AS p
USING(product_id)