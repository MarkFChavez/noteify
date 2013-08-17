class NotesController < ApplicationController

  before_filter :authenticate_user!
  layout "dashboard"

  def index
	  @note = Note.new
	  @unplaced_notes = current_user.notes.unplaced

	  respond_to do |format|
		format.html
		format.json { render json: @notes }
	  end
  end

  def show
	  @note = current_user.notes.find(params[:id])

	  respond_to do |format|
		format.html
		format.json { render json: @note }
	  end
  end

  def new
	  @note = Note.new
  end

  def create
	  @note = current_user.notes.build(params[:note])
	
	  respond_to do |format|
		if @note.save
			format.html { redirect_to notes_path, notice: "You have created a note" }
			format.json do
				render json: {result:"You have created a note", validation: 0}
			end
		else
			format.html { render :new }
			format.json do
				render json: {result:"Unable to create note", validation: 1}
			end
		end
	  end
  end

  def edit
	  @note = current_user.notes.find(params[:id])

	  respond_to do |format|
		format.html
		format.json { render json: @note }
	  end
  end

  def update
	  @note = current_user.notes.find(params[:id])

	  respond_to do |format|
		if @note.update_attributes(params[:note])
			format.html { redirect_to @note, notice:"You have updated a note" }
			format.json do
				render json: {result:"You have updated a note"}
			end
		else
			format.html { render :edit }
			format.json do
				render json: {result:"Unable to update note"}
			end
		end
	  end
  end

  def destroy
	  @note = current_user.notes.find(params[:id])

	  respond_to do |format|
		if @note.destroy
			format.html { redirect_to notes_path, notice:"You have deleted a note" }
			format.json do
				render json: {result:"You have deleted a note"}
			end
		else
			format.html { redirect_to @note, alert:"Unable to delete note" }
			format.json do
				render json:{result:"Unable to delete note"}
			end
		end
	  end
  end
end
