class EventsController < ApplicationController

  def index
    @events = Event.all

    respond_to do |format|
      format.html { render 'events/index', locals: { events: Event.all } }
      if params_valid?(params)
        format.json { render json: Event.get_month(params[:year], params[:month]), status: :ok }
      else
        format.json { render json: {data: 'Invalid parameters'}, status: :bad_request }
      end
    end

  end

  private

  def params_valid?(params)
    params[:year].present? && params[:month].present? && year_valid?(params[:year]) && month_valid?(params[:month])
  end

  def year_valid?(year)
    int_year = year.to_i
    int_year > 2000 && int_year < 2050
  end

  def month_valid?(month)
    int_month = month.to_i
    int_month >= 1 && int_month <= 12
  end
end
