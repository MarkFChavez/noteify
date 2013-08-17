class HomeController < ApplicationController

  before_filter :authenticate_user!

  def index
	@notes = current_user.notes
  end
end
