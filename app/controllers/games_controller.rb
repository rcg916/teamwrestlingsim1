class GamesController < ApplicationController
	def index
		@games = Game.all
	end

	def new
		@game = Game.new
	end

	def create
		Game.create(game_params)
		redirect_to playing_path
	end

	def show
		@game = Game.last
	end

	def advance
		@endofyear = false
		@newweeknum = Game.last.weeknum += 1
		if @newweeknum <= 4
			Game.last.update_attribute :weeknum, @newweeknum
		else
			Game.last.update_attribute :weeknum, 1
			@newmonthnum = Game.last.monthnum += 1
			if @newmonthnum <= 4
				Game.last.update_attribute :monthnum, @newmonthnum
			else
				Game.last.update_attribute :monthnum, 1
				@newyearnum = Game.last.yearnum += 1
				Game.last.update_attribute :yearnum, @newyearnum
				@endofyear = true
				redirect_to endofyear_path
			end
		end
		if @endofyear != true
			redirect_to playing_path
		end
	end

	def endofyear
	end

	private

  def game_params
    params.require(:game).permit(:teamname, :coachname)
  end
end
