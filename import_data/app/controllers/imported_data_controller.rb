class ImportedDataController < ApplicationController

  rescue_from ActionController::ParameterMissing, with: :render_parameter_error

  def new
    @imported_datum = ImportedDatum.new
  end

  def create
    @imported_datum = ImportedDatum.new
    if imported_datum_params[:file].present?
      @imported_datum.file = imported_datum_params[:file]
      unless !(gross_revenue = @imported_datum.import)
        flash[:notice] = "The data have been saved.  The gross revenue is $%.2f." % gross_revenue
      else
        flash[:warning] = 'An error was encountered.'
      end
    end

    render :new, status: :ok
  end

  private

  def imported_datum_params
    params.require(:imported_datum).permit(:file)
  end

  def render_parameter_error(error)
    render :new, status: :ok
  end

end

