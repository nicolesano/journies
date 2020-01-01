class HabitsController < ApplicationController
    def index
        @habits = Habit.all
    end

    def new
        @habit = current_user.habits.build
    end

    def show    
        @habit = Habit.find(params[:id])
    end

    def create
        @habit = current_user.habits.build(habit_params)
        if @habit.save
            redirect_to habit_path(@habit)
        else
            render :new
        end
    end

    def habit_params
        params.require(:habit).permit(:name, :status)
    end
end
