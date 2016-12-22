class Seed
  def self.start
    seed = Seed.new
    seed.create_roles
    seed.create_categories
    seed.create_registered_users
    seed.create_admin
    seed.create_platform_admin
    seed.create_projects
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

  def create_projects
    offsetable_categories = Category.count - 1
    offsetable_users = User.count - 1
    1000.times do |i|
      user = User.offset(rand(0..offsetable_users)).limit(1).first
      category = Category.offset(rand(0..offsetable_categories)).limit(1).first
      title = Faker::Commerce.product_name + " #{i}"
      slug = title.parameterize
      project = Project.create!(title: title,
                             description: Faker::Hipster.paragraph,
                             goal: Faker::Number.number(4),
                             slug: slug,
                             category_id: category.id,
                             )
      add_user(project)
      create_pledge_and_comment(project)
      puts "project #{i}: Project #{project.title} created, with Category #{project.category.name}
            with a creator of #{project.users.first.name}, a pledge of #{project.funding_received}."
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

  private

  def add_user(project)
    available_users = Role.find_by(name: "registered").users
    number = rand(1..User.count)
    user = User.find(number)
    project.users << user
  end
  
  def create_pledge_and_comment(project)
    available_users = Role.find_by(name: "registered").users
    number = rand(1..User.count)
    pledge_amount = Faker::Number.number(3) 
    user = User.find(number)
    if user.id == project.users.first.id
      user = User.find(number)
    else
      user
    end
    Pledge.create!(user_id: user.id, project_id: project.id, amount_given: pledge_amount)
    user.roles << Role.find_by(name: "backer")
    create_comment(user, project)
  end
  
  def create_comment(user, project)
    Comment.create!(comment_body: Faker::Hacker.say_something_smart, project_id: project.id, user_id: user.id)
  end
  
end

Seed.start