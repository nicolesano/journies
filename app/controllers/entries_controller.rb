class EntriesController < ApplicationController
    def index
        @entries = Entry.all
    end

    def new
        @journal = Journal.find(params[:journal_id])
        @entry = Entry.new
    end

    def show
        @entry = Entry.find(params[:id])
    end

    def create
        @journal = Journal.find(params[:journal_id])
        @entry = @journal.entries.new(entry_params)
        if @entry.save
            redirect_to journals_path(@entry)
        else
            render :new
        end
    end

    def entry_params
        params.require(:entry).permit(:title, :content, :user_id, :journal_id)
    end    
end
