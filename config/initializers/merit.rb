# Use this hook to configure merit parameters
Merit.setup do |config|
  # Check rules on each request or in background
  # config.checks_on_each_request = true

  # Define ORM. Could be :active_record (default) and :mongoid
  # config.orm = :active_record

  # Add application observers to get notifications when reputation changes.
  # config.add_observer 'MyObserverClassName'

  # Define :user_model_name. This model will be used to grand badge if no
  # `:to` option is given. Default is 'User'.
  # config.user_model_name = 'User'

  # Define :current_user_method. Similar to previous option. It will be used
  # to retrieve :user_model_name object if no `:to` option is given. Default
  # is "current_#{user_model_name.downcase}".
  # config.current_user_method = 'current_user'
end

# Create application badges (uses https://github.com/norman/ambry)
# badge_id = 0
# [{
#   id: (badge_id = badge_id+1),
#   name: 'just-registered'
# }, {
#   id: (badge_id = badge_id+1),
#   name: 'best-unicorn',
#   custom_fields: { category: 'fantasy' }
# }].each do |attrs|
#   Merit::Badge.create! attrs
# end

merits = [
  {name: 'Newbie', description: '', level: 'level'},
  {name: 'Novice', description: '', level: 'level'},
  {name: 'Rookie', description: '', level: 'level'},
  {name: 'Beginner', description: '', level: 'level'},
  {name: 'Talented', description: '', level: 'level'},
  {name: 'Skilled', description: '', level: 'level'},
  {name: 'Intermediate', description: '', level: 'level'},
  {name: 'Skillful', description: '', level: 'level'},
  {name: 'Seasoned', description: '', level: 'level'},
  {name: 'Proficient', description: '', level: 'level'},
  {name: 'Experienced', description: '', level: 'level'},
  {name: 'Advanced', description: '', level: 'level'},
  {name: 'Senior', description: '', level: 'level'},
  {name: 'Expert', description: '', level: 'level'}
]

merits.each_with_index do |merit, n|
  name = merit[:name]
  desc = merit[:description]
  level = merit[:level]
  
  Merit::Badge.create!(
    id: n,
    name: name,
    description: desc,
    custom_fields: { level: level + n.to_s }
  )
end
