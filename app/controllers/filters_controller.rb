class FiltersController < ApplicationController

    def index
        @filters = Filter.all
    end

    def show
        @filter = filter.find(params[:id])
    end

end
