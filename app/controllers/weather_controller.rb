class WeatherController < ApplicationController
    require 'httparty'
    
    def index; end

    def get_weather
        city = params[:city]
        api_key = Rails.application.credentials[:weather_api]

        url =  "http://api.openweathermap.org/data/2.5/weather?q=#{city}&appid=#{api_key}&units=metric"

        response = HTTParty.get(url)

        if response.code == 200
            @weather_data = response.parsed_response
        else
            @error = "City not found"
        end

        render :index
    end
end