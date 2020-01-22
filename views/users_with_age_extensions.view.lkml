include: "/users_extended.view"

view: users_with_age_extensions {
  sql_table_name: users ;;
    extends: [users_extended]
    suggestions: no

    dimension: age {
      type: number
      sql: ${TABLE}.age ;;
    }

    dimension: status {
      type: string
    }
  }
