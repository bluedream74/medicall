class Dashboard::Clinic::IvrRuleItemsController < Dashboard::Clinic::ApplicationController
  def new
    parent_item = current_clinic.ivr_rule.items.find(params[:item_id]) if params[:item_id]
    @item = if parent_item
              parent_item.children.build
            else
              current_clinic.ivr_rule.items.build
            end
  end

  def edit
  end

  def create
    @item = current_clinic.ivr_rule.items.build(clinic_id: current_clinic.id, **item_params)
    if @item.save
      redirect_to dashboard_clinic_ivr_rule_path(current_clinic)
    else
      render :new
    end
  end

  private

    def item_params
      params.require(:clinic_ivr_rule_item).permit(:name, :ancestry)
    end
end
