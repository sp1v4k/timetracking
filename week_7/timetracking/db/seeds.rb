# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if Rails.env.development?
  User.destroy_all # this destroys also all TimeEntries, as they depent on the Projects

  User.create!(
    [
      { name: "Toni", email: "tonifrost@hotmail.com", password: "pioloide"},
      { name: "Cristina", email: "cris.jim.pla@gmail.com", password: "pioloide"}
    ]
  )

  User.all.each do |user|
    user.projects.create!(
      [
        { name: "TimeTracker", description: "a Rails app", user_id: user.id},
        { name: "IronHack", description: "bla bla bla", user_id: user.id },
        { name: "P123", description: "???", user_id: user.id },
        { name: "Barcelona", description: "city, Spain", user_id: user.id },
      ]
    )
  end
  Project.all.each do |project|
    TimeEntry.create!(project: project, hours: 5, minutes: 33, date: Date.today, comments: "My first time entry")
  end
end
