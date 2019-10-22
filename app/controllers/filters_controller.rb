class FiltersController < ApplicationController

    def index
        @filters = Filter.all
    end

    def show
        @filter = Filter.find(params[:id])
    end

end
