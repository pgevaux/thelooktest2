view: orders {
  sql_table_name: demo_db.orders ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: created {
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
    sql: ${TABLE}.created_at ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }
#   filter: selected_department
#     suggest_dimension: department
#
#   dimension: product_type
#     sql: |
#       CASE
#       WHEN {% condition selected_department %} '' {% endcondition %}
#       THEN ${department}
#
#       WHEN {% condition selected_department %} ${department} {% endcondition %}
#       THEN ${category}
#
#       END



  measure: count {
    type: count
    drill_fields: [id, users.last_name, users.first_name, users.id, order_items.count]
  }
}
