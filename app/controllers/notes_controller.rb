class NotesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_note, only: %i[show edit update destroy clone download_note_as_word]

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
        redirect_notice = t('notes.create.success_notice')
        format.html { redirect_to notes_url, notice: redirect_notice }
        format.json { render :show, status: :created, location: @note }
      else
        flash[:alert] = @note.errors.full_messages.first
        format.html { render :new }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @note = note_service.update_note(note_params.merge(id: params.fetch(:id)))

    respond_to do |format|
      if @note.save
        redirect_notice = t('notes.update.success_notice')
        format.html { redirect_to @note, notice: redirect_notice }
        format.json { render :show, status: :ok, location: @note }
      else
        flash[:alert] = @note.errors.full_messages.first
        format.html { render :edit }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @note.destroy
    respond_to do |format|
      format.html { redirect_to notes_url, notice: t('notes.destroy.success_notice') }
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

  def download_note_as_word
    word = note_service.generate_word(@note)
    time_stamp = I18n.l(Time.zone.now, format: '%Y-%m-%d-%H%M%S')
    word_file_name = @note.title.gsub(' ', '_') + '_' + time_stamp
    send_data(word, filename: "#{word_file_name}.docx", content_type: 'application/vnd.openxmlformats-officedocument.wordprocessingml.document')
  end

  private


  def note_service
    NoteService
  end

  def set_note
    @note = Note.visible_by(current_user).find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def note_params
    params.fetch(:note, {}).permit(:title, :body)
  end
end
