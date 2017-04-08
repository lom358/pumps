# Контроллер для выгрузки и загрузки Excel файлов
require 'csv'
class Admin::ProcessDocsController < Admin::AdminController

  attr_accessor :headers, :row, :doc

  def index

  end

  def download_exl
    package = Axlsx::Package.new({:author=>'Grachev Denis'})
    workbook = package.workbook
    name = 'pumps.xls'
    pumps_category_id = params[:pumps_category_id].to_i
    # Вытаскиваем набор категорий насосов по пришедшему параметру
    # Если таковых нет - возращаем ответ клиенту NOT FOUND (404)
    @pumps_category = PumpsCategory.where(id: pumps_category_id).first
    return render :json => {status: 404, response: 'not found category'} unless @pumps_category
    # Загружаем насосы
    @pumps = @pumps_category.pumps.load
    # Создаем первую закладку
    workbook.add_worksheet(name: "Basic work sheet") do |sheet|
      # Добавляем название полей PumpsCategory
      sheet.add_row PumpsCategory.column_names.to_a
      # Добавляем строку с содержимым PumpsCategory
      sheet.add_row @pumps_category.attributes.values.to_a
      # Добавляем название полей насоса
      sheet.add_row Pump.column_names.to_a
      @pumps.each do |pump|
        # Для каждого насосоа выписываем аттрибуты отдельной строкой
        sheet.add_row pump.attributes.values.to_a
      end
    end
    package.serialize('public/' + name)
    render :json=> {'status':200, 'responce':'ok', path:name}
  end

  def download_csv
    name = 'pumps.csv'
    pumps_category_id = params[:pumps_category_id].to_i
    # Вытаскиваем набор категорий насосов по пришедшему параметру
    # Если таковых нет - возращаем ответ клиенту NOT FOUND (404)
    @pumps_category = PumpsCategory.where(id: pumps_category_id).first
    return render :json => {status: 404, response: 'not found category'} unless @pumps_category
    @pumps = @pumps_category.pumps.load
    # wb - означает открыть c пересозданием
    CSV.open('public/' + name, "wb") do |csv|
      csv << PumpsCategory.column_names.to_a
      csv << @pumps_category.attributes.values
      csv << Pump.column_names.to_a
      @pumps.each do |pump|
        csv << pump.attributes.values
      end
    end
    render :json=> {'status':200, 'responce':'ok', path:name}
  end

end