%w(/apps/psoft/appl).each do |path|
  directory path do
    owner 'psoft'
    group 'psoft'
    action :create
  end
end
