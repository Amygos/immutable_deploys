#cloud-config
write_files:
  - path: /opt/app/conf.env
    content: |
      DB_HOST="${db_host}"
      DB_PORT="${db_port}"
      DB_USER="${db_user}"
      DB_PASSWORD="${db_password}"
      DB_NAME="${db_name}"
