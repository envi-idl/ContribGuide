;+
; :Description:
;    Simple example procedure to classify and do some
;    classification cleanup on the classified raster.
;
;
;
; :Keywords:
;    INPUT_RASTER: in, required, type=ENVIRaster
;      Specify the ENVI raster you want to classify and
;      process
;    OUTPUT_RASTER_URI: in, requried, type=string
;      Provide the fully-qualified filepath for the 
;      processed classification raster to have.
;
; :Author: Zachary Norman - znorman@harris.com
;-
pro classify_raster, $
  INPUT_RASTER = input_raster,$
  OUTPUT_RASTER_URI = output_raster_uri
  
  compile_opt idl2
  
  ;check if ENVI is running, if not start ENVI
  e = envi(/current)
  if (e eq !NULL) then begin
    e = envi(/headless)
  endif
  
  ;create a classification ENVIRaster
  ;create our classification task
  ClassifyTask = ENVITask('ISODATAClassification')
  ClassifyTask.INPUT_RASTER = input_raster
  ClassifyTask.Execute
  
  ; Get the task from the catalog of ENVITasks
  SmoothTask = ENVITask('ClassificationSmoothing')
  SmoothTask.INPUT_RASTER = ClassifyTask.OUTPUT_RASTER
  SmoothTask.Execute
  
  ;create our first cleanup task
  SievingTask = ENVITask('ClassificationSieving')
  SievingTask.INPUT_RASTER = SmoothTask.OUTPUT_RASTER
  SievingTask.Execute
  
  ;create our second cleanup task
  AggregationTask = ENVITask('ClassificationAggregation')
  AggregationTask.INPUT_RASTER = SievingTask.OUTPUT_RASTER
  
  ;set our output raster URI here so we know what our
  ;output is. otherwise we can let ENVI make temp names
  ;by default
  AggregationTask.OUTPUT_RASTER_URI = output_raster_uri
  AggregationTask.Execute
end
