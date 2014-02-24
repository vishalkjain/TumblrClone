class SearchesController < ApplicationController
  def index
    @results = PgSearch.multisearch(params[:search])
    @results = @results.includes(:searchable)

  end
end
