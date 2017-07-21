; Add the extension to the toolbox. Called automatically on ENVI startup.
; this procedure needs to have the same name as the one at the bottom of the code
; with an additional "_extensions_init" at the end. This is what ENVI uses 
; on startup to identify how to create the buttons
pro sample_extension_extensions_init
  compile_opt idl2

  ; get current ENVI session
  e = envi(/CURRENT)

  ; add the extension ENVI, two required arguments
  e.AddExtension, $
    'Sample Extension',$      ; first argument is the name of the button that will be showwn in the extensions folder
    $'sample_extension',$ ; second argument is the procedure that will be run when you click the button
    PATH = ''            ; optionally you can specify the folder that the tool will go in. this looks like
                         ; PATH = '/Some/Folder/Structure'
end


; ENVI Extension code. Called when the toolbox item is chosen.
pro sample_extension
  compile_opt idl2
  
  ; general error handler that returns a traceback for the UI
  ; not the prettiest way to handle errors, but easy for debugging
  catch, Error_status
  if (Error_status ne 0) then begin
    catch, /CANCEL
    help, /LAST_MESSAGE, output = err_txt
    p = dialog_message(err_txt)
    return
  endif
  
  ; get current session of ENVI, start UI if not already open
  ; this is here in case someone runs this script from the IDL workbench directly
  e = envi(/current)
  if (e eq !NULL) then begin
    e = envi()
  endif

  ; get some task from ENVI's task catalog
  task = ENVITask('SpectralIndices')
  
  ; create a dialogue for the task made by ENVI
  ok = e.UI.SelectTaskParameters(task)

  ;run the tool if  the user says OK int he process dialog
  if (ok eq 'OK') then begin
    ; run the task
    task.execute
    
    ; display the results
    ; NOTE that this will potentially change based one each task
    view = e.getview()
    layer = view.createlayer(task.OUTPUT_RASTER)
  endif

end
