require 'bundler'
Bundler.require

$:.unshift File.expand_path("./../lib/app", __FILE__)

require 'game'
require 'board'

newg = Game.new
newg.turn
newg.game_end
