#!/usr/bin/env ruby

require 'fileutils'
require 'json'
require 'pathname'
require 'tmpdir'

losses_and_gif_paths = Dir['./**/*.json'].map do |json_path|
  gif_path = json_path.sub(/batch_stats.json$/, 'summary.gif')
  calculated_loss = JSON.load(File.read(json_path))['calculated_loss']
  if calculated_loss.nil?()
    unless gif_path.match?(/final_generation.json$/)
      raise ['nil calculated loss', gif_path, calculated_loss]
    end
  else
    [calculated_loss, gif_path]
  end
end.reject(&:nil?).sort_by(&:first).reverse

all_image_paths = []
best_gif_path = nil
losses_and_gif_paths.each do |calculated_loss, gif_path|
  all_image_paths << gif_path
  best_gif_path = gif_path
end

FileUtils.cp best_gif_path, 'best_generation_summary.gif'
puts "running ImageMagick 'convert' to generate final_summary.gif"
system("convert -delay 24 #{all_image_paths.map{|x| "'#{x}'" }.join(' ')} final_summary.gif") && puts('saved final_summary.gif')

puts "running gifsicle to generate final_summary_optimized.gif"
system("gifsicle -i final_summary.gif -O3 --colors 256 --resize 384x256 -o final_summary_optimized.gif")
FileUtils.rm 'final_summary.gif'

