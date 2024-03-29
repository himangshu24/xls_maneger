class ImportedDataController < ApplicationController
  
  def index
    @imported_data = ImportedDatum.all
  end
  require 'roo'
  def create
    file = params[:file]
    
    if file.present?
      spreadsheet = Roo::Spreadsheet.open(file.path, extension: :xls)
      header = spreadsheet.row(1)
    
      (2..spreadsheet.last_row).each do |i|
        row = Hash[[header, spreadsheet.row(i)].transpose]
        ImportedDatum.create(row)
      end
      
      redirect_to imported_data_index_path, notice: "Data imported successfully"
    else
      redirect_to imported_data_index_path, alert: "Please select a file to import"
    end
  end
  def destroy
    @imported_data = ImportedData.find(params[:id])
    @imported_data.destroy
    redirect_to imported_data_index_path, notice: "Data deleted successfully"
  end
end
