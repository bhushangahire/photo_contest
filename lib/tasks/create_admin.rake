include Rails.application.routes.url_helpers

begin
  namespace :admin do
    task :create => :environment do
      desc "Interactive script to create a user"
      puts "You will be prompted to enter an email address and password for the new admin"
      puts "Enter an email address:"
      email = STDIN.gets
      puts "Enter a password:"
      password = STDIN.gets
      unless email.strip!.blank? || password.strip!.blank?
        if User.create!(:email => email, :password => password)
          puts "The admin was created successfully."
          puts "User name #{email}. Password: #{password}"
          puts "Log in at #{new_user_session_path}"
        else
          puts "Sorry, the admin was not created!"
        end
      end
    end
  end
end