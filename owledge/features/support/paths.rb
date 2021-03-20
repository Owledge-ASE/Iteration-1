module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /^the (Owledge )?home\s?page$/ then '/notebooks'
    when /^the notebooks page$/ then '/notebooks'
    when /^the (?:notebook|details) page for "(.+)"$/
      notebook_path(Note.find_by_title($1))
    when /^the create page$/ then '/notebooks/new'
    when /^the notebook with ID ([0-9]+)$/ then "/notebooks/$1"

    #Andrea
    #when /^the profile page for "([^"]+)"/ then
    #user = User.where(:email => $1).first
    #page.current_path.should == find_user_registration_path(user)
      #edit_user_registration_path(:id => $1)

    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
                "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)