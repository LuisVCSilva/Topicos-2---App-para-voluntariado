class KarmaController < ApplicationController

  def show
  end

  def index
   @scoreGeral = ActiveRecord::Base.connection.execute("SELECT thredded_user_details.id,thredded_user_details.posts_count,users.id,users.display_name FROM users INNER JOIN thredded_user_details on users.id=thredded_user_details.id").to_a.sort_by { |hsh| hsh[:posts_count] }
  end

end
