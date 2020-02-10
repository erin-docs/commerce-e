view: users_extended {
  sql_table_name: users_extended ;;
  suggestions: yes

  dimension: name {
    sql: ${TABLE}.first_name ;;
  }

  dimension: status {
    sql: orders.status ;;
    type: number
  }
}
