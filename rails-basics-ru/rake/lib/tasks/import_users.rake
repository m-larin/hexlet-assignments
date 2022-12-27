# frozen_string_literal: true

require 'csv'

namespace :hexlet do
  desc 'Import users from csv files'
  task :import_users, [:name] => :environment do |t, args|
    file = args[:name]
    print "Task started, file=#{file}\n"

    users = CSV.read(file)
    first_row = true
    users.each do |user|
      if first_row
        first_row = false
      else
        user_model = User.new
        user_model.first_name = user[0]
        user_model.last_name = user[1]
        user_model.birthday = Date.strptime(user[2], '%m/%d/%Y')
        user_model.email = user[3]

        if user_model.save
          print "Import #{user_model.last_name}\n"
        else
          print "Error import #{user_model.last_name} #{user_model.errors.full_messages}\n"
        end
      end
    end

    print "done\n"
  end
end
