# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
=begin
role = Role.create(:role => "Developer")
role = Role.create(:role => "Host")
=end
# Creation of Host sample Profile
=begin
user = User.create(:email => "ezio@email.com", :firstname => "Ezio", :lastname => "Bertoglio", :country => "IT", :location => "Turin", :roles_id => 2, :password => "fabrizio")


# To be edited when database is resetted, you should fix the Host object
user = User.find(user.id)
user.skip_confirmation!	
=end
=begin
user = User.find(17)
host = Host.new(:description => "Hello, my name is Fabrizio and I have a couple of nice Web Development projects that i would like to realize with the help from other developers.", :interest_list => "snowboarding, surfing", :skill_list => "project management,")
user.host = host
user.save
=end
user = User.find(17)
location = Location.create(:description => "Nice Room near to Awesome Ski Resort", :location => "Prali", :singleroom => 1, :skiresort => 1, :country => "IT", :state => "Piedmont")
user.host.locations << location

project = Project.create(:name => "WifiSharing", :description => "Earning Money from Wifi Sharing", :percentage_completion => 0, :budget => 0, :nemployees => 0, :hiring => 1, :ninvestors => 0)
user.host.projects << project

task = Task.create(:name => "Front end WebSite", :description => "creation of the Front End responsive Website for all devices", :completed => 0, :skills_list => "css, html, javascript,", :days => 4)
project.tasks << task

ad = Ad.create(:title => "Front End WebDevelopment", :description => "Webapp Front End Development with HTML, CSS on Ruby on Rails Framework", :budget => 0, :days => 5, :skill_list => "css, html, javascript")
project.ads << ad
location.ads << ad
task.ad = ad