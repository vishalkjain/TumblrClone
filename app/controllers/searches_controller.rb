class SearchesController < ApplicationController
  def index
    @results = PgSearch.multisearch(params[:search])
    @results = @results.includes(:searchable).page(params[:page])
    @search_name = params[:search]

  end
end
