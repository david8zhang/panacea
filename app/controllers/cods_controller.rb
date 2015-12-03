class CodsController < ApplicationController
  def index
    @cods = Cod.all
    @cod = Cod.find(params[:id])
    @countries = Country.all
  end

  def show
    @cods = Cod.all
    @cod = Cod.find(params[:id])
    @countries = Country.all
    gon.countrynames = [['Country', 'Deathtoll']]
    gon.links = []
     @countries.each do |country|
       gon.countrynames << [country.name,
         country.country_cods.find_or_create_by(cod_id: @cod.id).deathtoll]
       gon.links << country_path([cod_id: @cod.id, country_id: country.id])

    end
  end
end
