view: currency_conversion {
  derived_table: {
    persist_for: "1 hour"
    indexes: ["currency_code"]
    sql: select 1.6177963874 as currency_conversion, "AUD" as currency_code, "GBP" as source
      union all
      select 3.8401013872, "BRL", "GBP"
      union all
      select 1.6408759481, "CAD", "GBP"
      union all
      select 1.2368923366, "CHF", "GBP"
      union all
      select 8.6172228316, "DKK", "GBP"
      union all
      select 1.159124908, "EUR", "GBP"
      union all
      select 1, "GBP", "GBP"
      union all
      select 9.5021292963, "HKD", "GBP"
      union all
      select 140.1376954807, "JPY", "GBP"
      union all
      select 1415.0373308318, "KRW", "GBP"
      union all
      select 24.0351397052, "MXN", "GBP"
      union all
      select 1.7448205479, "NZD", "GBP"
      union all
      select 71.659141473, "RUB", "GBP"
      union all
      select 1.7316516128, "SGD", "GBP"
      union all
      select 37.9878395336, "TWD", "GBP"
      union all
      select 1.2239233147, "USD", "GBP"
      from demo_db.order_items
      LIMIT 16 ;;
  }

  dimension: source {
    type: string
    sql: ${TABLE}.source ;;
  }

  dimension: currency_code {
    primary_key: yes
    type: string
    sql: ${TABLE}.currency_code ;;
  }

  measure: currency_conversion {
    type: number
    sql: ${TABLE}.currency_conversion ;;
    value_format_name: decimal_4
  }
}
