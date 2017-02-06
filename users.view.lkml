view: users {
  sql_table_name: demo_db.users ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: age {
    type: number
    sql: ${TABLE}.age ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: country {
    type: string
    sql: ${TABLE}.country ;;
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

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
    drill_fields: [city,age,state]
  }
  dimension: male {
    type: yesno
    sql: ${TABLE}.gender like 'm' ;;
  }
  dimension: female {
    type: yesno
    sql: ${TABLE}.gender like 'f' ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
    drill_fields: [city]
  }

  dimension: zip1 {
    type: number
    sql: ${TABLE}.zip ;;
  }
  dimension: zipcode {
    type: zipcode
    sql: ${TABLE}.zip ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }
  measure: min_age {
    type: min
    sql: ${TABLE}.age ;;
    drill_fields: [detail*]
  }
  measure: max_age {
    type: max
    sql: ${TABLE}.age ;;
    drill_fields: [detail*]
  }
  measure: avg_age {
    type: average
    sql: ${TABLE}.age ;;
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      last_name,
      first_name,
      events.count,
      orders.count,
      user_data.count
    ]
  }
}
