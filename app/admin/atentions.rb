ActiveAdmin.register Atention do
  actions :index, :show, :new, :create, :update, :edit, :destroy
  config.xls_builder.i18n_scope = [:activerecord, :attributes, :atention]
  config.xls_builder.column('technologist') do |atention|
    atention.technologist.name
  end
  config.xls_builder.column('user_name') do |atention|
    atention.user.full_name
  end
  after_build do |atention|
    atention.user = current_user
    atention.save
  end

  form do |f|
    f.inputs do
      f.input :technologist
      f.input :business
      f.input :channel
      f.input :cause
      f.input :subcause
      f.input :detail
      f.input :solution
      f.input :escalation
      f.input :escalation_responsable
    end
    f.actions
  end

  action_item :new, only: :show do
    link_to "Nueva atención", new_admin_atention_path(@atention = Atention.new)
  end

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :channel, :technologist_id, :cause, :subcause, :detail, :solution, :escalation, :escalation_responsable, :user_id, :business_id, :user
  #
  # or
  #
  # permit_params do
  #   permitted = [:channel, :technologist_id, :cause, :subcause, :detail, :solution, :escalation, :escalation_responsable, :user_id, :business_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
