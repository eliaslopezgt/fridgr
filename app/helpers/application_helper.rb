module ApplicationHelper
  def render_esi(path)
      "<esi:include src=\"#{path}\" >>"
  end
end
