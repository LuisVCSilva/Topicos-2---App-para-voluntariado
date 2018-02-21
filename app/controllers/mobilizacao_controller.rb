#mobilizacao_controller.rb
require 'yaml'

class MobilizacaoController < ApplicationController

  def index
  end

  def show
   @metas = ActiveRecord::Base.connection.execute("SELECT * FROM thredded_messageboards").to_a

  end

  def edit
  end

  def update
   @metas = ActiveRecord::Base.connection.execute("SELECT * FROM thredded_messageboards").map{|meta| meta["name"]}
   #Meta.create(meta_params)
   #puts "Entrei no index"
   data = YAML.load_file("#{Rails.root}/config/locales/en.yml")
   @nome = params[:nomeMobilizacao]
   @subtitulo = params[:subtitulo]
   @descricao = params[:descricao]
   if !@nome.to_s.empty?
    data["en"]["brand"]["name"] = @nome.to_s
   end
   if !@subtitulo.to_s.empty?
    data["en"]["brand"]["subtitle"] = @subtitulo.to_s
   end
   if !@descricao.to_s.empty?
    data["en"]["brand"]["description"] = @descricao.to_s
   end
   File.open("#{Rails.root}/config/locales/en.yml", 'w') { |f| YAML.dump(data, f) }
   redirect_back(fallback_location: root_path)
  end

  def create
  end

end
