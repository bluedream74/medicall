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
    @item = current_clinic.ivr_rule.items.find(params[:id])
  end

  def create
    @item = current_clinic.ivr_rule.items.build(clinic_id: current_clinic.id, **item_params)
    if @item.save
      redirect_to dashboard_clinic_ivr_rule_path(current_clinic)
    else
      render :new
    end
  end

  def update
    @item = current_clinic.ivr_rule.items.find(params[:id])
    if @item.update(item_params)
      redirect_to dashboard_clinic_ivr_rule_path(current_clinic)
    else
      render :edit
    end
  end

  private

    def item_params
      params.require(:clinic_ivr_rule_item).permit(:name, :body, :ancestry)
    end
end
