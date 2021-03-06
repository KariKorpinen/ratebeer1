module ApplicationHelper
  def edit_and_destroy_buttons(item)
    unless current_user.nil?
      edit = link_to('Edit', url_for([:edit, item]), class:"btn btn-primary")
      del = link_to('Destroy', item, method: :delete, data: {confirm: 'Are you sure?'}, class:"btn btn-danger")
      raw("#{edit} #{del}")
    end
  end

  def ratings_average_with_one_decimal(item)
    raw(number_with_precision(item,precision: 1))   
    #jos rails console, käyttö vaatii: include ActionView::Helpers::NumberHelper
  end
end
