class CompletedDatesController < ApplicationController
    before_action :set_journal, only: [:new, :create, :edit, :update, :destroy]
    before_action :set_habit, only: [:show, :mark, :edit, :update, :destroy]
    before_action :set_completed_date, only: [:show, :mark, :edit, :update, :destroy]

    def index
        @completed_dates = CompletedDate.all
    end

    def new
        @completed_date = CompletedDate.new
    end

    def show
    end

    def create
        @completed_date = @journal.habit.completed_dates.new(completed_date_params)
        if @completed_date.save
            redirect_to journal_path(@journal)
        else
            render :new
        end
    end

    def set_habit
        @habit = Habit.find(params[:id])
    end

    private

    def completed_date_params
        params.require(:completed_date).permit(:date, :habit_id, :user_id, :journal_id)
    end

    def set_journal
        @journal = Journal.find(params[:journal_id])
    end

    def set_completed_date
        @habit = Habit.find(params[:id])
    end
end
