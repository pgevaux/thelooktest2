view: currency_conversion {
  derived_table: {
    persist_for: "1 hour"
    indexes: ["currency_code"]
    sql: select 1.6177963874 as currency_conversion, "AUD" as currency_code, "GBP" as source_currency, '2017-03-01' as datecurr
      union all
      select 3.8401013872, "BRL", "GBP", '2017-03-01'
      union all
      select 1.6408759481, "CAD", "GBP", '2017-03-01'
      union all
      select 1.2368923366, "CHF", "GBP", '2017-03-01'
      union all
      select 8.6172228316, "DKK", "GBP", '2017-03-01'
      union all
      select 1.159124908, "EUR", "GBP", '2017-03-01'
      union all
      select 1, "GBP", "GBP", '2017-03-01'
      union all
      select 9.5021292963, "HKD", "GBP", '2017-03-01'
      union all
      select 140.1376954807, "JPY", "GBP", '2017-03-01'
      union all
      select 1415.0373308318, "KRW", "GBP", '2017-03-01'
      union all
      select 24.0351397052, "MXN", "GBP", '2017-03-01'
      union all
      select 1.7448205479, "NZD", "GBP", '2017-03-01'
      union all
      select 71.659141473, "RUB", "GBP", '2017-03-01'
      union all
      select 1.7316516128, "SGD", "GBP", '2017-03-01'
      union all
      select 37.9878395336, "TWD", "GBP", '2017-03-01'
      union all
      select 1.2239233147, "USD", "GBP", '2017-03-01'
      union all
      select 1.7177963874, "AUD", "GBP", '2017-03-02'
      union all
      select 3.7401013872, "BRL", "GBP", '2017-03-02'
      union all
      select 1.7408759481, "CAD", "GBP", '2017-03-02'
      union all
      select 1.2768923366, "CHF", "GBP", '2017-03-02'
      union all
      select 8.7172228316, "DKK", "GBP", '2017-03-02'
      union all
      select 1.179124908, "EUR", "GBP", '2017-03-02'
      union all
      select 1, "GBP", "GBP", '2017-03-02'
      union all
      select 9.7021292963, "HKD", "GBP", '2017-03-02'
      union all
      select 147.1376954807, "JPY", "GBP", '2017-03-02'
      union all
      select 1417.0373308318, "KRW", "GBP", '2017-03-02'
      union all
      select 24.7351397052, "MXN", "GBP", '2017-03-02'
      union all
      select 1.9448205479, "NZD", "GBP", '2017-03-02'
      union all
      select 71.359141473, "RUB", "GBP", '2017-03-02'
      union all
      select 1.3316516128, "SGD", "GBP", '2017-03-02'
      union all
      select 37.3878395336, "TWD", "GBP", '2017-03-02'
      union all
      select 1.3239233147, "USD", "GBP", '2017-03-02'
      union all
      select 1.7177963874, "AUD", "GBP", '2017-03-03'
      union all
      select 3.7401013872, "BRL", "GBP", '2017-03-03'
      union all
      select 1.7408759481, "CAD", "GBP", '2017-03-03'
      union all
      select 1.2768923366, "CHF", "GBP", '2017-03-03'
      union all
      select 8.7172228316, "DKK", "GBP", '2017-03-03'
      union all
      select 1.179124908, "EUR", "GBP", '2017-03-03'
      union all
      select 1, "GBP", "GBP", '2017-03-03'
      union all
      select 9.7021292963, "HKD", "GBP", '2017-03-03'
      union all
      select 147.1376954807, "JPY", "GBP", '2017-03-03'
      union all
      select 1417.0373308318, "KRW", "GBP", '2017-03-03'
      union all
      select 24.7351397052, "MXN", "GBP", '2017-03-03'
      union all
      select 1.9448205479, "NZD", "GBP", '2017-03-03'
      union all
      select 71.359141473, "RUB", "GBP", '2017-03-03'
      union all
      select 1.3316516128, "SGD", "GBP", '2017-03-03'
      union all
      select 37.3878395336, "TWD", "GBP", '2017-03-03'
      union all
      select 1.3239233147, "USD", "GBP", '2017-03-03'
      from demo_db.order_items
      LIMIT 48 ;;
  }

  dimension: datecurr {
    type: date
    sql: ${TABLE}.datecurr ;;
  }

  dimension: source_currency {
    hidden:  yes
    type: string
    sql: ${TABLE}.source_currency ;;
  }

  dimension: currency_code {
    primary_key: yes
    type: string
    sql: ${TABLE}.currency_code ;;

  }

  dimension: currency_conversion {
    type: number
    sql: ${TABLE}.currency_conversion ;;
    value_format_name: decimal_4
  }
}
