class Dashboard::Clinic::IvrRulesController < Dashboard::Clinic::ApplicationController
  def show
    current_clinic.create_ivr_rule! unless current_clinic.ivr_rule
    @root = current_clinic.ivr_rule.items.find_by(ancestry: nil)
  end
end
