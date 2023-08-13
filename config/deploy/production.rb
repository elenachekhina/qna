# server-based syntax
# ======================
# Defines a single server with a list of roles and multiple properties.
# You can define all roles on a single server, or split them:

# server "167.172.39.59", user: "deploy", roles: %w{app db web}, primary: true
# server '167.172.39.59', user: "deploy", port: 22, roles: [:web, :app, :db], primary: true
# server "example.com", user: "deploy", roles: %w{app web}, other_property: :other_value
# server "db.example.com", user: "deploy", roles: %w{db}

 # set :ssh_options, {
 #   keys: %w(/Users/echekhina/.ssh/id_rsa),
 #   auth_methods: %w(publickey)
 # }
