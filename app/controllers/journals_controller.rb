class JournalsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]

    def index
        @journals = Journal.all
    end

    def new
        @journal = current_user.journals.build
    end

    def show
        @journal = Journal.find(params[:id])
    end

    def create
        @journal = current_user.journals.build(journal_params)
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
