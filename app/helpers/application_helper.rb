module ApplicationHelper

  class HTMLwithPygments < Redcarpet::Render::HTML
    def block_code(code, language)
      Pygments.highlight(code, lexer: language)
    end
  end

  def markdown(text)
    renderer = HTMLwithPygments.new(hard_wrap: true, filter_html: true)
    extensions = {
      autolink: true,
      no_intra_emphasis: true,
      fenced_code_blocks: true,
      lax_html_blocks: true,
      strikethrough: true,
      superscript: true,
      hard_wrap: true,
      prettify: true
    }
    Redcarpet::Markdown.new(renderer, extensions).render(text).html_safe
  end  

  def current_path
    request.env['PATH_INFO']
  end

  def adds_error_class_if_present(errors)
    if errors.any?
      ' has-error'
    end
  end

end
