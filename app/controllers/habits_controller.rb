class HabitsController < ApplicationController
    def index
        @habits = Habit.all
    end

    def new
        @journal = Journal.find(params[:journal_id])
        @habit = Habit.new
    end

    def show    
        @habit = Habit.find(params[:id])
    end

    def create
        @journal = Journal.find(params[:journal_id])
        @habit = @journal.habits.new(habit_params)
        if @habit.save
            redirect_to journal_path(@journal)
        else
            render :new
        end
    end

    def habit_params
        params.require(:habit).permit(:name, :status, :user_id, :journal_id)
    end
end
