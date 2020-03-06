# frozen_string_literal: true

require 'sinatra'
require 'nokogiri'
require 'pry'

require_relative 'google_dialog'

before do
  request.body.rewind
  @request_payload = JSON.parse(request.body.read, symbolize_names: true)
  @request_payload.each { |name, value| instance_variable_set("@#{name.to_s.tr('-', '_')}", value) }
end

post '/orchestrate' do
  
  puts "Payload is #{@request_payload}"
  puts "Instance variables are #{instance_variables}"
  payload = GoogleDialog.new(@fm_conversation, @fm_question, @fm_avatar[:avatarSessionId]).query_dialogflow
  content_type :json
  payload.to_json
end

