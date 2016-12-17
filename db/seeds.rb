class Seed
  def self.start
    seed = Seed.new
    seed.create_roles
    seed.create_categories
    seed.create_registered_users
    seed.create_admin
    seed.create_platform_admin
  end

  def create_roles
    ['registered', 'backer', 'banned', 'admin', 'platform admin'].each do |role|
      Role.create!(name: role)
      puts "Creating role: #{role}"
    end
  end

  def create_categories
    (%w(Art Crafts Design Fashion Film Food Games Music Photography Journalism Technology)).each do |category|
      category = Category.create!(name: category)
      puts "Creating category: #{category.name}"
    end
  end

  def create_registered_users
    100.times do |i|
      user = User.create!(name: Faker::Name.name,
                          email: Faker::Internet.email,
                          phone: Faker::PhoneNumber.phone_number,
                          password: Faker::Internet.password
                         )
      user.roles << Role.find_by(name: 'registered')
      puts "#{i}: #{user.name} with email #{user.email} and phone #{user.phone} created"
    end
  end

  def create_admin
    10.times do |i|
      admin = User.create!(name: Faker::Name.name,
                           email: Faker::Internet.email,
                           phone: Faker::PhoneNumber.phone_number,
                           password: Faker::Internet.password
                          )
      admin.roles << Role.find_by(name: 'admin')
      puts "#{i}: #{admin.name} as admin created"
    end
  end

  def create_platform_admin
    clancey = User.create!(name: 'Clancey', email: 'clancey007@example.com', phone: '12345678987', password: 'password')
    clancey.roles << Role.find_by(name: 'platform admin')
    puts "Created #{clancey.name} as platform admin"
  end
end

Seed.start
