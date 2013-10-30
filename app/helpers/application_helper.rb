module ApplicationHelper
  # Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = "Localite"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

 def pageless(total_pages, url=nil, container=nil)
    opts = {
      :totalPages => total_pages,
      :url        => url,
      :loaderMsg  => 'Loading more results',
      :loaderImage => image_path("load.gif")
    }
    
    container && opts[:container] ||= container
    
    javascript_tag("$('#results').pageless(#{opts.to_json});")
  end

end
