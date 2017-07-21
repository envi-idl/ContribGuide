;+
; NAME:
;   smooth_sailing
;
; PURPOSE:
;   There are no inputs.  The output is an animated GIF.  Thanks to CT
;   for providing this fun example GIF.
;   
;-
pro smooth_sailing, OUTPUT = output
  compile_opt idl2

  ; set the animated GIF's name
  output = filePath('ship_on_the_water.gif',/TMP)
  if file_test(output) then begin
    message, 'The file already exists: ' + output
  endif

  ; generate a fun animated GIF
  ;
  ; This code is taken from the IDL documentation on graphics' translate
  ; method.  
  ;
  
  x = findgen( 100 )
  y = 20 * sin( x * 2 * !PI / 25.0 ) * exp( -0.01 * x )
  
  ; Draw the sky and sea.
  p = plot( x, y, $
    xrange = [0, 99], yrange = [-40, 100], $
    fill_level = -40, $
    axis_style = 0, margin = 0, $
    dimensions = [500, 400], $
    background_color = "light sky blue", $
    /fill_background, fill_color = "sea green", $
    transparency = 100, $
    /buffer)
    
  ; Draw the sun.
  e = ellipse( 0.9, 1, fill_color = "yellow", color = "yellow" )
  
  ; Determine the points for the boat to travel.
  xx = 0.5 * [-22, -19, -12, -7, 8, 13, 18, 23, 0.5, 0.5, $
    13, 8, 0.5, 0.5, 8, 3, -2, -7, 0, 0, -7, -12, 0, 0]
  yy = 2 * [3, -0.7, -1, -1.5, -1.5, -0.7, 0.5, 3, 3, 5, $
    5, 13, 13, 15, 15, 20, 20, 15, 15, 13, 13, 5, 5, 3]
    
  ; Draw the boat. Give a Z value to put the boat on top.
  p1 = polygon( xx, yy, 1, /data, fill_color = "burlywood", clip = 0 )
  
  ; Translate p1 using data coordinates,
  ; translate e using device coordinates.
  for i = 1, 99 do begin
    p.save, output, res = 96, /append
    p1.translate, 1, y[i] - y[i - 1], /data
    e.translate, 1, -0.5
  endfor
  
  p.save, output, res = 96, /append, /close
  
end
