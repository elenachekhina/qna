# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit::Authorization

  rescue_from Pundit::NotAuthorizedError do |_exception|
    respond_to do |format|
      format.html do
        flash[:alert] = 'You are not authorized to perform this action.'

        redirect_to(request.referrer || root_path)
      end
    end
  end

  def search
    searchable_models = params[:searchables_model] || %w[question answer comment user]
    @searchables = searchable_models.map do |model|
      [model, ElasticsearchService.new(model).search(params[:query])]
    end.to_h
    render 'search/index'
  end

end
