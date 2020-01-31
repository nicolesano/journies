class EntriesController < ApplicationController
    before_action :find_entry, only: [:edit, :update, :destroy]
    before_action :find_entry, only: [:create, :update, :destroy]

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
        @entry = Entry.new(entry_params)
        @entry.journal = @journal
        if @entry.save(entry_params)
            redirect_to journal_path(@journal)
        else
            render :new
        end
    end

    def edit
    end

    def update
        @entry.journal = @journal
        if @entry.update(entry_params)
            redirect_to journal_path(@journal)
        else
            render :edit
        end
    end

    def destroy
        @entry.journal = @journal
        @entry.destroy
        redirect_to journal_path(@journal)
    end

    private

    def entry_params
        params.require(:entry).permit(:title, :content, :user_id, :journal_id, :photo)
    end

    def find_entry
        @entry = Entry.find_by(params[:id])
    end

    def find_journal
        @journal = Journal.find_by(params[:journal_id])
    end
end
