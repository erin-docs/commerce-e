include: "/views/events.view"
view: users {
  sql_table_name: users ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }


  dimension: age {
    type: number
    sql: ${TABLE}.age ;;
  }

  dimension: age_tier {
    type: tier
    sql:  ${age} ;;
    style: integer
    tiers: [0, 10, 20, 30, 40, 50, 60, 70, 80]
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
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
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: zip {
    type: zipcode
    sql: ${TABLE}.zip ;;
  }

  dimension: full_name {
    sql: ${first_name} || ' ' || ${last_name} ;;
  }


  dimension: shipping_city {
    sql: ${TABLE}.city ;;
#     group_label: "Shipping Info"
#     group_item_label: "City"
  }
  dimension: shipping_state {
    sql: ${TABLE}.state ;;
#     group_label: "Shipping Info"
#     group_item_label: "State"
  }
  dimension: shipping_street {
    sql: ${TABLE}.zip ;;
#     group_label: "Shipping Info"
#     group_item_label: "Street"
  }


dimension: user_events_id {
    sql: ${events.user_id};;
}

  measure: count {
    type: count
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
