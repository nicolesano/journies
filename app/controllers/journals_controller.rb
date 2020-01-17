class JournalsController < ApplicationController
    def index
        @journals = Journal.all
    end

    def new
        @journal = current_user.journals.build
    end

    def show    
        @default_quotes = 
            ["\"Those who stay will be champions.\" - Bo Schembechler", 
            "\"I haven’t failed. I’ve just found 10,000 ways that won’t work.\” - Thomas Edison", 
            "\"Don’t ask what the world needs. Ask what makes you come alive, and go do it. Because what the world needs is people who have come alive.\” - Howard Thurman", 
            "\"Life isn't about finding yourself. Life is about creating yourself.\” - George Bernard Shaw"]
        @journal = Journal.find(params[:id])
        @habit = Habit.new
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
