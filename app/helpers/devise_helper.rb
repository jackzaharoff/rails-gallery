module DeviseHelper
  def devise_error_messages!
    return "" if resource.errors.empty?
    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    sentence = "The form contains #{pluralize(resource.errors.count, 'error')}"
    html = <<-HTML
    <div  class="fade in alert alert-alert">
      #{sentence}
      <a class="close" data-dismiss="alert" href="#" aria-hidden="true">&times;</a>
      <div >
        <ul>
          #{messages}
        </ul>
      </div>
    </div>
    HTML
    html.html_safe
  end
end