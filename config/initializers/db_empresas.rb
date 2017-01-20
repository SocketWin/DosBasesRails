# save stats database settings in global var
DB_EMPRESAS = YAML::load(ERB.new(File.read(Rails.root.join("config","database_empresas.yml"))).result)[Rails.env]