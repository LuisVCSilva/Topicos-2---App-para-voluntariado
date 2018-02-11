#mobilizacao_controller.rb
require 'yaml'

class MobilizacaoController < ApplicationController

  def index

  end

  def show
  end

  def edit
  end

  def update
   #Meta.create(meta_params)
   #puts "Entrei no index"
   data = YAML.load_file("#{Rails.root}/config/locales/en.yml")
   @nome = params[:nomeMobilizacao]
   @subtitulo = params[:subtitulo]
   @descricao = params[:descricao]
   if !@nome.to_s.empty?
    system("sed -i 's/"+data["en"]["brand"]["name"]+"/"+@nome+"/g' \"#{Rails.root}/config/locales/en.yml\"")
   end
   if !@nome.to_s.empty?
   system("sed -i 's/"+data["en"]["brand"]["subtitle"]+"/"+@subtitulo+"/g' \"#{Rails.root}/config/locales/en.yml\"")
   end
   if !@nome.to_s.empty?
   system("sed -i 's/"+data["en"]["brand"]["description"]+"/"+@descricao+"/g' \"#{Rails.root}/config/locales/en.yml\"")
   end
   redirect_to("/")
  end

  def create
  end

end
