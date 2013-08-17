class NotesController < ApplicationController

  before_filter :authenticate_user!
  layout "dashboard"

  def index
	  @notes = current_user.notes
  end

  def show
	  @note = current_user.notes.find(params[:id])
  end

  def new
	  @note = Note.new
  end

  def create
	  @note = current_user.notes.build(params[:note])

	  if @note.save
		redirect_to notes_path, notice:"You have created a note"
	  else
		render :new
	  end
  end

  def edit
	  @note = current_user.notes.find(params[:id])
  end

  def update
	  @note = current_user.notes.find(params[:id])

	  if @note.update_attributes(params[:note])
		redirect_to @note, notice:"You have updated a note"
	  else
		render :edit
	  end
  end

  def destroy
	  @note = current_user.notes.find(params[:id])

	  if @note.destroy
		redirect_to notes_path, notice:"You have deleted a note"
	  else
		redirect_to @note, alert:"Oops! An error has occurred when deleting this note"
	  end
  end
end
