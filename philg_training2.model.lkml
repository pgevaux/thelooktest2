connection: "thelook"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

explore: order_items {
  label: "Customer Orders"

  join: inventory_items {
    type: left_outer
    sql_on: ${order_items.inventory_item_id} = ${inventory_items.id} ;;
    relationship: many_to_one
  }

  join: orders {
    type: left_outer
    sql_on: ${order_items.order_id} = ${orders.id} ;;
    relationship: many_to_one
  }

  join: products {
    type: left_outer
    sql_on: ${inventory_items.product_id} = ${products.id} ;;
    relationship: many_to_one
  }

  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }

  join: user_lifetime_facts {
    type: inner
    sql_on: ${users.id} = ${user_lifetime_facts.user_id} ;;
    relationship: one_to_one
  }

  join: currency_conversion {
    sql_on: ${order_items.source_currency} = ${currency_conversion.source_currency}
    and ${orders.created_date}=${currency_conversion.datecurr} ;;
    relationship: many_to_one
  }

}
