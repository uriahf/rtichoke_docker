library(plumber)
library(rtichoke)
library(htmlwidgets)
library(xml2)
library(dplyr)


#* @serializer html
#* @post /create_summary_report
function(req, res) {
  
  print(req$body)
  
  print("probs")
  print(typeof(req$body$probs))
  print(str(req$body$probs))
  print(is.list(req$body$probs))
  
  print("reals")
  print(typeof(req$body$reals))
  print(str(req$body$reals))
  print(is.list(req$body$reals))
  
  create_summary_report(
    probs = req$body$probs,
    reals = req$body$reals
  )
  
  as.character(xml2::read_html("summary_report.html"))
  
}

#* @post /prepare_performance_data
#* @serializer json
function(req, res){
  
  print("probs")
  
  print(req$body$probs)
  
  print("reals")
  print(req$body$reals)
  
  prepare_performance_data(
    probs = req$body$probs,
    reals = req$body$reals,
    stratified_by = req$body$stratified_by
  ) 
  
}


#* @post /create_roc_curve_list
#* @serializer json
function(req, res){

  print("probs")
  
  print(req$body$probs)
  
  print("reals")
  print(req$body$reals)
  
  print("by")
  
  print(req$body$by)
  
  print("stratified_by")
  print(req$body$stratified_by)
  
  print("size")
  print(req$body$size)
  
  print("color_values")
  print(req$body$color_values)  
  
    
  
  prepare_performance_data(
    probs = req$body$probs,
    reals = req$body$reals,
    by = req$body$by,
    stratified_by = req$body$stratified_by
   ) |> 
    rtichoke:::create_rtichoke_curve_list(
      "roc",
      size = req$body$size,
      color_values = req$body$color_values)
}

#* @post /plot_roc_curve_list
#* @serializer json
function(req, res){

    rtichoke:::create_rtichoke_curve_list(
      req$body$performance_data,
      "roc")
  
}

#* @post /create_lift_curve_list
#* @serializer json
function(req, res){
  
  
  # print(typeof(req$body$probs))
  # print(str(req$body$probs))
  # print(is.list(req$body$probs))
  print("probs")
  
  print(req$body$probs)
  
  print("reals")
  print(req$body$reals)
  # print(typeof(req$body$reals))
  # print(str(req$body$reals))
  # print(is.list(req$body$reals))
  # 
  print(
    prepare_performance_data(
      probs = req$body$probs,
      reals = req$body$reals,
      stratified_by = req$body$stratified_by
    )
  )
  
  prepare_performance_data(
    probs = req$body$probs,
    reals = req$body$reals,
    stratified_by = req$body$stratified_by
  ) |> 
    rtichoke:::create_rtichoke_curve_list("lift")
  
}


#* @post /create_precision_recall_curve_list
#* @serializer json
function(req, res){
  
  
  # print(typeof(req$body$probs))
  # print(str(req$body$probs))
  # print(is.list(req$body$probs))
  print("probs")
  
  print(req$body$probs)
  
  print("reals")
  print(req$body$reals)
  # print(typeof(req$body$reals))
  # print(str(req$body$reals))
  # print(is.list(req$body$reals))
  # 
  print(
    prepare_performance_data(
      probs = req$body$probs,
      reals = req$body$reals,
      stratified_by = req$body$stratified_by
    )
  )
  
  prepare_performance_data(
    probs = req$body$probs,
    reals = req$body$reals,
    stratified_by = req$body$stratified_by
  ) |> 
    rtichoke:::create_rtichoke_curve_list("precision recall")
  
}

#* @post /create_gains_curve_list
#* @serializer json
function(req, res){
  
  
  # print(typeof(req$body$probs))
  # print(str(req$body$probs))
  # print(is.list(req$body$probs))
  print("probs")
  
  print(req$body$probs)
  
  print("reals")
  print(req$body$reals)
  # print(typeof(req$body$reals))
  # print(str(req$body$reals))
  # print(is.list(req$body$reals))
  # 
  print(
    prepare_performance_data(
      probs = req$body$probs,
      reals = req$body$reals,
      stratified_by = req$body$stratified_by
    )
  )
  
  prepare_performance_data(
    probs = req$body$probs,
    reals = req$body$reals,
    stratified_by = req$body$stratified_by
  ) |> 
    rtichoke:::create_rtichoke_curve_list("gains")
  
}

#* @post /create_calibration_curve_list
#* @serializer json
function(req, res){
  
  print("probs")
  
  print(req$body$probs)
  
  print("reals")
  print(req$body$reals)
  
  create_calibration_curve_list(
    probs = req$body$probs,
    reals = req$body$reals
  )
  
}

#* @post /prepare_performance_data
#* @serializer json
function(req, res){
  
  
  # print(typeof(req$body$probs))
  # print(str(req$body$probs))
  # print(is.list(req$body$probs))
  print("probs")
  
  print(req$body$probs)
  
  print("reals")
  print(req$body$reals)
  # print(typeof(req$body$reals))
  # print(str(req$body$reals))
  # print(is.list(req$body$reals))
  # 
  print(
    prepare_performance_data(
      probs = req$body$probs,
      reals = req$body$reals,
      stratified_by = req$body$stratified_by
    )
  )
  
  prepare_performance_data(
    probs = req$body$probs,
    reals = req$body$reals,
    stratified_by = req$body$stratified_by
  )
  
}