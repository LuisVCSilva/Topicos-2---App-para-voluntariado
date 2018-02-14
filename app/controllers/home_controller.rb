class HomeController < ApplicationController

  def show
   @metas = ActiveRecord::Base.connection.execute("SELECT name FROM thredded_messageboard_groups").to_a
   puts "====================================================================================="
  end

  def index
   @metas = ActiveRecord::Base.connection.execute("SELECT name FROM thredded_messageboard_groups").to_a	
   puts "====================================================================================="
  end

end
