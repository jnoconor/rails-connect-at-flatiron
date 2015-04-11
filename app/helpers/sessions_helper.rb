module SessionsHelper

  def twitter_signin
    link_to '/auth/twitter', :class => "btn btn-default" do
      raw("<i class='icon-twitter'></i>   Sign In w/ Twitter")
    end
  end
end
