module ApplicationHelper
  require 'bitly'

  def get_share_url(page_url) # あるページの短縮URLを生成するヘルパー
    Bitly.use_api_version_3
    bitly = Bitly.new('o_3drnmgb2qc', 'R_f17a499d205047aab9bf8906ce56482d')
    bitly.shorten(page_url).short_url
  end

  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      puts association.to_s.singularize + "_fields"
      render(association.to_s.singularize + "_fields", f: builder)
    end
    link_to(name, '#', class: "add_fields btn btn-default", data: {id: id, fields: fields.gsub("\n", "")})
  end

  def shallow_args(namespace, parent, child)
    if namespace.nil?
      child.try(:new_record?) ? [parent, child] : child
    else
      child.try(:new_record?) ? [namespace, parent, child] : [namespace, child]
    end
  end

end
