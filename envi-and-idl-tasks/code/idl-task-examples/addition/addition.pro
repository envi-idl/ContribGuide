;+
; :Description:
;    Addition task example
;
; :Examples:
;    http://<hostname>:9191/ese/IDL/addition/execute?a=2&b=2
;
; :Params:
;    a: first number input
;    b: second number input
;    c: optional third number input
;       
; :Returns:
;    answer: result number
;       
;-
pro addition, A = a, $
              B = b, $
              RESULT = result, $
              C = c
  compile_opt idl2
   
  if (c eq !NULL) then begin
    result = a + b
  endif else begin
    result = a + b + c
  endelse
    
end
