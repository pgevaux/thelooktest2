- dashboard: dashboard_1
  title: Dashboard 1
  layout: tile
  tile_size: 100

  filters:

  elements:
    # - name: hello_world
    #   type: looker_column

    - name: add_a_unique_name_1486138662
      title: Untitled Visualization
      type: looker_scatter
      model: philg_training2
      explore: users
      dimensions: [users.state]
      measures: [users.max_age, users.min_age, users.avg_age]
      filters:
        users.female: 'Yes'
        users.state: California,Colorado,Nevada,Oregon,Washington,Massachusetts,Maine,New Jersey,New York
      sorts: [users.max_age desc]
      limit: '500'
      column_limit: '50'
      query_timezone: America/Los_Angeles
      stacking: ''
      show_value_labels: false
      label_density: 25
      legend_position: center
      x_axis_gridlines: false
      y_axis_gridlines: true
      show_view_names: true
      limit_displayed_rows: false
      y_axis_combined: true
      show_y_axis_labels: true
      show_y_axis_ticks: true
      y_axis_tick_density: default
      y_axis_tick_density_custom: 5
      show_x_axis_label: true
      show_x_axis_ticks: true
      x_axis_scale: auto
      y_axis_scale_mode: linear
      show_null_points: true
      point_style: circle
      ordering: none
      show_null_labels: false
      show_totals_labels: false
      show_silhouette: false
      totals_color: "#808080"
      series_types: {}
      colors: ['palette: Santa Cruz']
  series_colors:
    users.max_age: "#ff0030"
    users.min_age: "#0cbf0a"
