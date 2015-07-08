module ApplicationHelper
  def render_esi(path)
    if Rails.env.development?
      div_id = Digest::MD5.hexdigest(path + rand.to_s)
      script = "$.ajax({" +
          "type:\"GET\"," +
          "async: false," +
          "url:\"#{path}\"," +
          "dataType:\"html\"," +
          "success:function(html) {$(\"##{div_id}\").html(html)}});"
      content_tag(:div, '', :id => div_id) + content_tag(:script, script.html_safe, :type => 'text/javascript')
    else
      "<esi:include src=\"#{path}\" >>"
    end
  end
end
