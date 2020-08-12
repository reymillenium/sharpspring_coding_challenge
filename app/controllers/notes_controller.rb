class NotesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_note, only: %i[show edit update destroy clone]

  def index
    notes_scope = Note.visible_by(current_user)
    @notes_scope_meta = notes_scope.ransack(params[:q])
    @notes = @notes_scope_meta.result
  end

  def show
  end

  def new
    @note = Note.new
  end

  def edit
  end

  def create
    @note = note_service.build_note(note_params.merge(user_id: current_user.id))

    respond_to do |format|
      if @note.save
        # format.html { redirect_to @note, notice: 'Note was successfully created.' }
        format.html { redirect_to notes_url, notice: 'Note was successfully created.' }
        format.json { render :show, status: :created, location: @note }
      else
        flash[:alert] = @note.errors.full_messages.first
        format.html { render :new }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notes/1
  # PATCH/PUT /notes/1.json
  def update
    respond_to do |format|
      if @note.update(note_params)
        format.html { redirect_to @note, notice: 'Note was successfully updated.' }
        format.json { render :show, status: :ok, location: @note }
      else
        flash[:alert] = @note.errors.full_messages.first
        format.html { render :edit }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notes/1
  # DELETE /notes/1.json
  def destroy
    @note.destroy
    respond_to do |format|
      format.html { redirect_to notes_url, notice: 'Note was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def clone
    new_note = note_service.generate_clone_from_original(@note)

    if new_note.save
      redirect_notice = t('notes.clone.success_notice', resource: @note.title)
      respond_to do |format|
        format.html { redirect_to :notes, notice: redirect_notice }
        format.js { head(:ok) }
      end
    else
      redirect_to action: :index
    end
  end

  private


  def note_service
    NoteService
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_note
    @note = Note.visible_by(current_user).find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def note_params
    params.fetch(:note, {}).permit(:title, :body)
  end
end
