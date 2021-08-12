class BeatsController < ApplicationController
  before_action :set_beat, only: %i[ show edit update destroy ]

  # GET /beats or /beats.json
  def index
    @beats = Beat.all
  end

  # GET /beats/1 or /beats/1.json
  def show
  end

  # GET /beats/new
  def new
    @beat = Beat.new
  end

  # GET /beats/1/edit
  def edit
  end

  # POST /beats or /beats.json
  def create
    @beat = Beat.new(beat_params)
    @mp3Lease = @beat.licenses.new({name: 'Mp3', info: 'You may only sell up to 5,000 copies of the song', price:25.00, has_wav: false, has_trackouts: false, beat: @beat })
    @wavLease = @beat.licenses.new({name: 'Wav', info: 'You may only sell up to 15,000 copies of the song', price:25.00, has_wav: false, has_trackouts: false, beat: @beat })
    @trackoutLease = @beat.licenses.new({name: 'Wav Trackouts', info: 'You may only sell up to 50,000 copies of the song', price:25.00, has_wav: false, has_trackouts: false, beat: @beat })
    respond_to do |format|
      if @beat.save
        format.html { redirect_to @beat, notice: "Beat was successfully created." }
        format.json { render :show, status: :created, location: @beat }
        [@mp3Lease, @wavLease, @trackoutLease].each do |lease|
          lease.save
        end
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @beat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /beats/1 or /beats/1.json
  def update
    respond_to do |format|
      if @beat.update(beat_params)
        format.html { redirect_to @beat, notice: "Beat was successfully updated." }
        format.json { render :show, status: :ok, location: @beat }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @beat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /beats/1 or /beats/1.json
  def destroy
    @beat.destroy
    respond_to do |format|
      format.html { redirect_to beats_url, notice: "Beat was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_beat
      @beat = Beat.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def beat_params
      params.require(:beat).permit(:title, :preview, :mp3, :wav, :free, :cover, :tempo, :scale)
    end
end
