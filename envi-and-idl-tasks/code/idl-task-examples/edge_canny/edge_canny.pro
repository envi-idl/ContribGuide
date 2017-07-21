;+
; :Description:
;    EDGE CANNY task example
;
; :Examples:
;   http://<hostname>:9191/ese/IDL/edge_canny/submitJob?input=image.tif

; :Params:
;       
; :Returns:
;    RESULT CANNY PNG
;
; :Keywords:
;    INPUT: input image
;    RESULT: CANNY output
;
;-
pro edge_canny, INPUT = input, BEFORE = before, RESULT = result
  compile_opt idl2
  
  ; Setup outputs
  before = filepath('before_canny.png',/TMP)
  if file_test(before) then begin
    message, 'The file already exists: ' + before
  endif
  
  result = filepath('result_canny.png',/TMP)
  if file_test(result) then begin
    message, 'The file already exists: ' + result
  endif
  
  ; Read input TIFF 
  inputImage = read_tiff(filepath(input, SUBDIRECTORY = ['examples', 'data']))
  
  ; Write client png before edge detection
  write_png, before, inputImage
  
  ; Perform edge detection using defaults
  filtered = canny(inputImage)
  img = image(filtered, MAX_VALUE=1,/BUFFER)
  img.save, result, BORDER=0

end