

#' 请输入文件
#'
#' @return 返回值
#' @import shiny
#' @import tsui
#'
#' @examples
#' mngrCostFunc_left()
mngrCostFunc_left<- function() {

  res <- tagList(

    tsui::mdl_text(id = 'txt_mngrCost_year',label = '年份',value = tsdo::getYear()),
    tsui::mdl_text(id = 'txt_mngrCost_period',label = '月份',value = tsdo::getMonth()),
    shinyWidgets::actionBttn(inputId = 'btnmngrCost_query',label = '查看'),
    tsui::mdl_download_button(id = 'btnmngrCost_dl',label = '下载'),
    hr(),
    tsui::uiTemplate(templateName = '产品管理成本模板'),
    br(),
    tsui::mdl_file(id = 'filemngrCost_upload',label = '请选择需要产品管理成本EXCEL文件'),
    tsui::mdl_text(id = 'txt_mngrCost_sheet',label = '页签',value =  'data'),
    shiny::actionButton(inputId = 'btnmngrCost_upload',label = '上传本月管理成本'),
    shiny::actionButton(inputId = 'btnmngrCost_syncLastOne',label = '同步上月管理成本')

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
#' mngrCostFunc_right()
mngrCostFunc_right<- function() {
  res <- tagList(

    uiScrollX(mdl_dataTable(id = 'dataviewmngrCost_query',label = '产品管理成本'))
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
#' mngrCostUI()
mngrCostUI <- function(tabTitle ='产品管理成本',
                       colTitles =c('操作区域','报表区域'),
                       widthRates =c(4,8),
                       func_left = mngrCostFunc_left,
                       func_right =mngrCostFunc_right) {
  res = uiGen(tabTitle = tabTitle,colTitles =colTitles,widthRates = widthRates,func_left = func_left,func_right = func_right )
  return(res)
}
