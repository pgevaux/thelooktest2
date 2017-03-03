view: products {
  sql_table_name: demo_db.products ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: brand {
    type: string
    sql: ${TABLE}.brand ;;
    drill_fields: [category]
  }

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
    drill_fields: [brand]
  }

  dimension: department {
    type: string
    sql: ${TABLE}.department ;;
  }

  dimension: item_name {
    type: string
    sql: ${TABLE}.item_name ;;
  }

  dimension: rank {
    type: number
    sql: ${TABLE}.rank ;;
  }

  dimension: retail_price {
    type: number
    sql: ${TABLE}.retail_price ;;
  }
  dimension: retail_price_tier {
    type: tier
    style: integer
    sql: ${TABLE}.retail_price ;;
    tiers: [10,50,100,500,1000]
  }

  dimension: sku {
    type: string
    sql: ${TABLE}.sku ;;
  }
  filter: selected_department {
    suggest_dimension: department
    }

  dimension: product_type {
      sql: CASE
      WHEN {% condition selected_department %} '' {% endcondition %} THEN ${department}
      WHEN {% condition selected_department %} ${department} {% endcondition %}
      THEN ${category} END;;
  }


  measure: count {
    type: count
    drill_fields: [id, item_name, inventory_items.count]
  }
  measure: retail_price_sum {
    type: sum
    sql: ${TABLE}.retail_price;;

  }

}
