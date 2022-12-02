

#' 请输入文件
#'
#' @return 返回值
#' @import shiny
#' @import tsui
#'
#' @examples
#' mfgCostFunc_left()
mfgCostFunc_left<- function() {

  res <- tagList(

    tsui::mdl_text(id = 'txt_mfgCost_year',label = '年份',value = tsdo::getYear()),
    tsui::mdl_text(id = 'txt_mfgCost_period',label = '月份',value = tsdo::getMonth()),
    shinyWidgets::actionBttn(inputId = 'btnmfgCost_query',label = '查看'),
    tsui::mdl_download_button(id = 'btnmfgCost_dl',label = '下载'),
    hr(),
    tsui::uiTemplate(templateName = '产品生产成本模板'),
    br(),
    tsui::mdl_file(id = 'filemfgCost_upload',label = '请选择需要产品生产成本EXCEL文件'),
    tsui::mdl_text(id = 'txt_mfgCost_sheet',label = '页签',value =  'data'),
    shiny::actionButton(inputId = 'btnmfgCost_upload',label = '上传本月生产成本'),
    shiny::actionButton(inputId = 'btnmfgCost_syncLastOne',label = '同步上月生产成本')

  )
  return(res)

}






#' 请输入文件
#'
#' @return 返回值
#' @import tsui
#' @import shiny
#'
#' @examples
#' mfgCostFunc_right()
mfgCostFunc_right<- function() {
  res <- tagList(

    uiScrollX(mdl_dataTable(id = 'dataviewmfgCost_query',label = '产品成本'))
  )
  return(res)

}

#' 产品分组UI
#'
#' @param tabTitle 标题
#' @param com_left 左
#' @param com_right 右
#'
#' @return 返回值
#' @export
#'
#' @examples
#' mfgCostUI()
mfgCostUI <- function(tabTitle ='产品生产成本',
                       colTitles =c('操作区域','报表区域'),
                       widthRates =c(4,8),
                       func_left = mfgCostFunc_left,
                       func_right =mfgCostFunc_right) {
  res = uiGen(tabTitle = tabTitle,colTitles =colTitles,widthRates = widthRates,func_left = func_left,func_right = func_right )
  return(res)
}
