class QueriesController < ApplicationController
  def sql
    sql = "SELECT customers.id AS customer_id,
                  customers.first_name AS customer_first_name,
                  categories.id AS category_id,
                  categories.name AS category_name
            FROM customers
            INNER JOIN orders ON orders.customer_id = customers.id
            INNER JOIN products ON products.id = orders.product_id
            INNER JOIN categories ON categories.id = products.category_id
            ORDER BY customers.id, categories.id"

    @categories_bought_by_customers = ActiveRecord::Base.connection.execute(sql)
  end

  def active_record
    @categories_bought_by_customers =
        Customer.joins(orders: [product: :category])
                .order("customer_id asc, category_id asc")
                .pluck("customers.id, customers.first_name, categories.id, categories.name")
  end

end
