current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "admin"
client_key               "#{current_dir}/admin.pem"
validation_client_name   "timeinc-validator"
validation_key           "#{current_dir}/timeinc-validator.pem"
chef_server_url          "https://pschefserver.timeinc.com/organizations/timeinc"
syntax_check_cache_path  "#{ENV['HOME']}/.chef/syntaxcache"
cookbook_path            [".","..","#{current_dir}/../cookbooks"]
