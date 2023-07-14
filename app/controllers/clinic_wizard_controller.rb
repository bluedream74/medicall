class ClinicWizardController < ApplicationController

  def create
    @clinic = Clinic.new(clinic_params)
    if @clinic.save
      current_user.clinics << @clinic
      days_of_week = Schedule.day_of_weeks.keys
      sessions = Schedule.sessions_i18n.invert.keys
      times = [['09:00', '13:00'], ['13:00', '19:00']] # Adjust the last range as per your needs
  
      # Confirm that `sessions` and `times` have the same length
      if sessions.length != times.length
        raise "The length of `sessions` (#{sessions.length}) and `times` (#{times.length}) do not match."
      end
  
      7.times do |i|
        sessions.each_with_index do |session, j|
          @clinic.schedules.build(day_of_week: days_of_week[i], session: session, start_time: times[j][0], end_time: times[j][1])
        end
      end
      render 'clinic_wizard/edit', notice: "クリニックが作成されました。"
    end
  end

  def edit
    @clinic = Clinic.includes(:schedules).find(params[:id])
  end

  def edit_info
    @clinic = Clinic.find(params[:id])
    render 'clinic_wizard/edit'
  end 

  def update_info
    @clinic = Clinic.find(params[:id])
    if @clinic.update(clinic_params)
      redirect_to complete_clinic_wizard_path(@clinic), notice: "登録が完了しました。"
    else
      render :edit
    end
  end

  def complete
    @clinic = Clinic.find(params[:id])
  end


  def update
    @clinic = Clinic.find(params[:id])

    if @clinic.update(clinic_params)
      if params[:commit] == '最終確認'
        redirect_to complete_clinic_wizard_path
      else
        render :next_step
      end
    else
      render :edit
    end
  end

  private

  def clinic_params
    params.require(:clinic).permit(:name, :address, :tel, :access, :holiday, :reserve, schedules_attributes: [:day_of_week, :session, :start_time, :end_time])
  end


end
