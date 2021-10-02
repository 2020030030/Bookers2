class SearchesController < ApplicationController
  before_action :authenticate_user!

  def searche
    	@model = params[:model]
		@content = params[:content]
		@method = params[:method]
		binding.pry
		if @model == 'user'
			@records = User.search_for(@content, @method)
		else
			@records = Book.search_for(@content, @method)
		end
  end
end
