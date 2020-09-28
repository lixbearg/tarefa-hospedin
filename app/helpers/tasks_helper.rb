module TasksHelper

  def get_task_status_badge(object)    
    case object.status
    when "pending"
      return raw('<span class="badge badge-warning">Em espera</span>')
    when "doing"
      return raw('<span class="badge badge-info">Em andamento</span>')
    when "done"
      return raw('<span class="badge badge-success">Concluído</span>')
    end
  end
end

def get_formatted_date(value)
  return I18n.l(value, format: :short_date) if value.present?
end