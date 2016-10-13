require './config/environment'
require_relative '../models/twitter_checker'
require_relative '../models/pumpkin_particle'
require 'pry'
require 'rufus-scheduler'

class ApplicationController < Sinatra::Base
    scheduler = Rufus::Scheduler.new
    checker = TwitterChecker.new('OlliesPumpkin')
    pumpkin_particle = PumpkinParticle.new

    get '/' do
      "done"
    end

    # scheduler.in '3s' do
    #   puts 'Hello... Rufus'
    # end

    scheduler.every '30s' do
        puts "test"
        if checker.new_tweet?
          pumpkin_particle.print_message(checker.latest_tweet)
        end
    end

    scheduler.join

end
