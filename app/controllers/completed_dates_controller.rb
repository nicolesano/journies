class CompletedDatesController < ApplicationController
    before_action :set_journal, only: [:new, :create, :edit, :update, :destroy]
    before_action :set_habit, only: [:show, :create, :edit, :update, :destroy]
    before_action :set_completed_date, only: [:show, :new, :create, :edit, :update, :destroy]

    def index
        @completed_dates = CompletedDate.all
    end

    def new
        @completed_date = @habit.completed_date.build(params[:completed_date])
    end

    def show
    end

    def create
        @completed_date = @habit.completed_dates.build(params[:completed_date])
        @completed_date.date = DateTime.now
        @parsed_date = Date.strptime("03/17/81", "%m/%d/%y")
        if @completed_date.save
            redirect_to journal_path(@journal)
        else
            render :new
        end
    end

    private

    def completed_date_params
        params.permit(:date, :habit_id, :user_id, :journal_id)
    end

    def set_journal
        @journal = Journal.find(params[:journal_id])
    end

    def set_habit
        @habit = Habit.find(params[:habit_id])
    end

    def set_completed_date
        @completed_date = CompletedDate.find_by(params[:id])
    end
end
