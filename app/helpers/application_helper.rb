module ApplicationHelper
  module ApplicationHelper
  def login_nav
    nav = ""
    if @auth.present?
      nav += "<li>#{link_to('Logout', '/login', :method => :delete, :remote => true, :class => 'button tiny alert')}</li>"
      if @auth.is_admin == true
        nav += "<li class='divider'></li>"
        nav += "<li>#{link_to('Zeppelins', zeppelins_path, :class => 'button tiny')}</li>"
        nav += "<li class='divider'></li>"
        nav += "<li>#{link_to('Voyages', voyages_path, :class => 'button tiny')}</li>"
        nav += "<li class='divider'></li>"
      else
        nav += "<li class='divider'></li>"
        nav += "<li class='has-dropdown'>#{link_to('My Voyages', '#', :class => 'button tiny')}"
        nav += "<ul class='dropdown'>"
        @auth.voyages.uniq.each do |voyage|
          nav += "<li>#{link_to(voyage.code, voyage)}</li>"
        end
        nav += "</ul>"
        nav += "</li>"
        nav += "<li class='divider'></li>"
        nav += "<li>#{link_to('Find Voyages', voyages_path, :class => 'button tiny')}</li>"
        nav += "<li class='divider'></li>"
      end
    else
      nav += "<li>#{link_to('Register', new_traveler_path, :remote => true, :class => 'button tiny')}</li>"
      nav += "<li class='divider'></li>"
      nav += "<li>#{link_to('Login', '/login', :remote => true, :class => 'button tiny')}</li>"
      nav += "<li class='divider'></li>"
    end
    nav
  end
end

end
