#!/usr/bin/env ruby
require 'RMagick'

width_char = 10
height_char = 15
tab_size = 2
x_offset = 1
width_img = 1280
height_img = 1024

canvas = Magick::Image.new(width_img, height_img)
gc = Magick::Draw.new


gc.stroke_width(0)
gc.stroke('transparent')
gc.fill_opacity(1)
gc.fill('black')
gc.rectangle(0, 0, width_img, height_img)


6.times do |i|
  color = Magick::Pixel.from_hsla(0,0,(10*(i+3)),1).to_color(Magick::AllCompliance,false,8)
  puts color.inspect
  gc.fill color
  x1 = x_offset+i*width_char*tab_size
  y1 = 0
  x2 = x_offset+i*width_char*tab_size+width_char*tab_size
  y2 = height_img
  gc.rectangle x1, y1, x2, y2
end

gc.draw(canvas)
canvas.quantize 256, Magick::GRAYColorspace
canvas.write('vim_bg.gif')

