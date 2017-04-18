view: user_lifetime_facts {
  derived_table: {
    indexes: ["user_id"]
    sql: SELECT u.id as user_id, count(o.id) as order_count, min(o.created_at) as first_order_date FROM demo_db.users u
      left outer join demo_db.orders o ON u.id = o.user_id
      group by u.id
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: user_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: order_count {
    type: number
    sql: ${TABLE}.order_count ;;
  }

  dimension: user_loyalty {
    case: {
      when: {
        sql: ${order_count}=0 ;;
        label: "No Orders"
      }
      when: {
        sql: ${order_count}=1 ;;
        label: "One Order"
      }
      when: {
        sql: ${order_count} between 1 and 4 ;;
        label: "Light Repeat Order"
      }
      when: {
        sql: ${order_count}>=5 ;;
        label: "Heavy Repeat Order"
      }
      else: "No Orders"
    }
  }

  dimension_group: first_order {
    type: time
    sql: ${TABLE}.first_order_date ;;
  }

  set: detail {
    fields: [user_id, order_count, first_order_time]
  }
}
