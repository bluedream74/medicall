class SchedulesController < ApplicationController
  before_action :set_clinic
  before_action :set_schedule, only: %i[show edit update destroy]

  # GET /schedules or /schedules.json
  def index
    @schedules = Schedule.all
  end

  # GET /schedules/1 or /schedules/1.json
  def show
  end

  # GET /schedules/new
  def new
    @schedule = Schedule.new
  end

  # GET /schedules/1/edit
  def edit
  end

  def create
    @schedule = @clinic.schedules.build(schedule_params)
    
    if @schedule.save
      redirect_to clinic_schedules_path(@clinic), notice: 'Schedule was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /schedules/1 or /schedules/1.json
  def update
    respond_to do |format|
      if @schedule.update(schedule_params)
        format.html { redirect_to schedule_url(@schedule), notice: "Schedule was successfully updated." }
        format.json { render :show, status: :ok, location: @schedule }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schedules/1 or /schedules/1.json
  def destroy
    @schedule.destroy

    respond_to do |format|
      format.html { redirect_to schedules_url, notice: "Schedule was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  def set_clinic
    @clinic = Clinic.find(params[:clinic_id])
  end
  # Use callbacks to share common setup or constraints between actions.
  def set_schedule
    @schedule = @clinic.schedules.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def schedule_params
    params.require(:schedule).permit(:day_of_week, :session, :start_time, :end_time)
  end
end
