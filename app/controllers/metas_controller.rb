#mobilizacao_controller.rb
require 'yaml'

class MetasController < ApplicationController

  def index
   @metas = ActiveRecord::Base.connection.execute("SELECT * FROM thredded_messageboards")
  end

  def show
   index
  end

  def edit
  end

  def update
   Metas.create(meta_params)
   puts "Entrei no index"
  end

  def delete
   redirect_to("/")
  end

  def create
  end

  def meta_params
     params.require(:metas).permit(:nome, :isDone)
  end
end
