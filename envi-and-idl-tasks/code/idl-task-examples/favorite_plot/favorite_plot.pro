;+
; :Description:
;    PLOT task example
;
; :Examples:
;    http://<hostname>:9191/ese/IDL/favorite_plot/submitJob?exponent=-0.04
;    
; :Params:    
;       
; :Returns:
;    RESULT PLOT PNG 
;
; :Keywords:
;    EXPONENT: exponential input
;    RESULT: PLOT PNG output
;       
;-
pro favorite_plot, EXPONENT = exponent, RESULT = result,$
  X = X, Y = y
  compile_opt idl2
  
  ;set the number of points
  npoints = 200
  
  x = findgen(npoints)
  y = sin(2.0*x*!PI/25.0) * exp(exponent*x)
  label = '$\it sin(2πx/25)^(' + strtrim(exponent,2) + 'x) $'
  p = plot(x, y, 'steel blue', /BUFFER, TITLE = title)

  img = p.copywindow()
  result = getenv('TEMP') + path_sep() + 'favorite_plot.png'
  
  if file_test(result) then begin
    message, 'The file already exists: ' + result
  endif
  
  write_png, result, img
  
end