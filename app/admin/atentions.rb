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
      f.input :cause, collection: [ "Consultas Aplicativos", "CRM Dynamics", "Facilidades", "Pedidos", "Peticiones", "Quejas", "Radicado", "Recaudo", "Reclamaciones", "Viáticos" ]
      f.input :subcause, collection: [ "Subcausa", "Ajustes OPEN", "Análisis Caso Facturación", "Análisis de Caso", "Árbol de transacciones", "Asesoría Funcionalidad", "Asesoría PQR", "Asesoría Regla de Negocio", "Asociar y recibir SE", "Atención de Reclamos en CNCRM", "Cambio de custodio", "Cambio de Estado de Corte", "Consulta nemónicos", "Creación de cuenta", "Debido Cobrar", "Debido Proceso", "Digitalizar Soportes a Enter", "Enter", "Falla en aplicativo", "Fenix ATC", "Gaspar", "Hidro", "Inconsistencia en legalización y/o registro", "Ingreso SE", "Matrícula Proveedor", "Matriz de Requisitos", "Mercurio", "Open", "Radicar Mercurio", "Retiro de Factura Web", "Sentry", "Separación/ Unificación Contrato", "Sicoper", "Transacciones", "Validación biometría", "Visado", "Visto bueno rebaja"]
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


