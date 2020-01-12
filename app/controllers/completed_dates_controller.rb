class CompletedDatesController < ApplicationController
    before_action :set_habit, only: [:show, :create]
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
end
