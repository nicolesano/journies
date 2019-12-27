class JournalsController < ApplicationController
    def index
        @journals = Journal.all
    end

    def new
        @journal = Journal.new
    end

    def show
        @journal = Journal.find(params[:id])
    end

    def create
        @journal = Journal.new(journal_params)
        if @journal.save
            redirect_to journal_path(@journal)
        else
            render :new
        end
    end

    def journal_params
        params.require(:journal).permit(:name)
    end    
end
