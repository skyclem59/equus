class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @horses = Horse.all.sample(6)
    @markers = Horse.where.not(latitude: nil, longitude: nil).map do |horse|
      {
        lat: horse.latitude,
        lng: horse.longitude#,
        # infoWindow: { content: render_to_string(partial: "/flats/map_box", locals: { flat: flat }) }
      }
    end
  end
end
