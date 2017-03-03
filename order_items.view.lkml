view: order_items {
  sql_table_name: demo_db.order_items ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: inventory_item_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.inventory_item_id ;;
  }

  dimension: order_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.order_id ;;
  }

  dimension_group: returned {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.returned_at ;;
  }

  measure: sale_price_gbp {
    type: sum
    sql: ${TABLE}.sale_price ;;
    value_format_name: gbp
  }

  dimension: sale_price_local_convert {
    hidden: yes
    type: number
    sql: ${TABLE}.sale_price*${currency_conversion.currency_conversion} ;;
  }

  measure: sale_price_local {
    type: sum
    sql: ${sale_price_local_convert} ;;
    value_format_name: decimal_2
  }

  dimension: source_currency {
    type: string
    sql: "GBP" ;;
  }

  measure: count {
    type: count
    drill_fields: [id, inventory_items.id, orders.id]
  }


}
