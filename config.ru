# frozen_string_literal: true

require 'rubygems'
require 'bundler'
require 'json'

Bundler.require

require './orchestrate'

# This takes two environment variables, GOOGLE_APPLICATION_CREDENTIALS, and GCP_CREDS, and writes a file to the efemeral file system of Heroku
# If you aren't using Heroku, i.e. if you have access to the local file system or you handle the GOOGLE auth json differently, this can be deleted
file = File.open("./#{ENV['GOOGLE_APPLICATION_CREDENTIALS']}", 'w') { |f|
    h = ENV['GCP_CREDS']
    f.puts JSON.parse(h).to_json
}

$stdout.sync = true
run Sinatra::Application
