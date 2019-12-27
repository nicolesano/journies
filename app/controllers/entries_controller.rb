class EntriesController < ApplicationController
    def index
        @entries = Entry.all
    end

    def new
        @entry = Entry.new
        @journal = Journal.find(params[:journal_id])
    end

    def show
        @entry = Entry.find(params[:id])
    end

    def create
        @entry = Entry.new(entry_params)
        if @entry.save
            redirect_to entry_path(@entry)
        else
            render :new
        end
    end

    def entry_params
        params.require(:entry).permit(:title, :content)
    end    
end
