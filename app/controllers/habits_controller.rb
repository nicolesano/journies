class HabitsController < ApplicationController
    before_action :set_journal, only: [:new, :create, :show, :edit, :update, :destroy]
    before_action :set_habit, only: [:show, :edit, :update, :destroy]
    def index
        @habits = Habit.all.sort_by &:name
    end

    def new
        @habit = Habit.new
    end

    def show
    end

    def create
        @habit = @journal.habits.new(habit_params)
        if @habit.save
            redirect_to journal_path(@journal)
        else
            render :new
        end
    end

    def edit
    end

    def update
        if @journal.habits.update(habit_params)
            redirect_to journals_path(@journal)
        else
            render :edit
        end
    end

    def destroy
        @habit.destroy
        redirect_to journal_path
    end

    private

    def habit_params
        params.require(:habit).permit(:name, :status, :user_id, :journal_id)
    end

    def set_journal
        @journal = Journal.find(params[:journal_id])
    end

    def set_habit
        @habit = @journal.habits.find(params[:habit_id])
    end
end