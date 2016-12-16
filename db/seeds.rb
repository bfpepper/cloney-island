['registered', 'backer', 'banned', 'admin', 'super admin'].each do |role|
  Role.find_or_create_by(name: role)
  puts "Creating role: #{role}"
end
