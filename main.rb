require 'sinatra/base'

Devices = {
  1 => {id: 1, uid: "d001", name: "Device #1"}, 
  2 => {id: 2, uid: "d002", name: "Device #2"}, 
  3 => {id: 3, uid: "d003", name: "Device #3"}, 
}

class ApplicationController < Sinatra::Base
  get '/' do
    "welcome"
  end
  get '/ping' do
    "pong"
  end
  get '/devices' do
    Devices.to_json
  end
  get '/devices/:id' do
    id = params["id"].to_i
    if Devices.key?(id)
      Devices[id].to_json
    else
      halt 404
    end
  end
end
