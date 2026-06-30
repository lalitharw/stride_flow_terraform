output "rds_host" {
    value = aws_db_instance.stride_flow_db_instance.address
}

output "rds_port" {
    value = aws_db_instance.stride_flow_db_instance.port
}