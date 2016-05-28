class Api::LsccController < ApplicationController
  def index

    payload = {}
    begin

      results = JSON.parse(Artist.first.to_json(include: {albums: {include: :songs, except: [:created_at, :updated_at]}}, except: [:created_at, :updated_at]))
      payload[:data] = results
      payload[:errors] = 0

    rescue Exception => e
      payload[:errors] = 0
      payload[:message] = e.message
    end

    render json: payload
  end

  def show
    payload = {}
    render json: payload
  end

end
