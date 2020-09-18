module ApplicationHelper
  def render_svg(name, styles: "", title: nil)
    filename = "media/images/#{name}.svg"
    title ||= name.underscore.humanize
    inline_svg_pack_tag(filename, aria: true, nocomment: true, title: title, class: styles)
  end

  def tailwind_classes_for(flash_type)
    {
      notice: "bg-green-400 border-green-700 text-white",
      alert: "bg-red-400 border-red-700 text-black"
    }.stringify_keys[flash_type.to_s] || flash_type.to_s
  end
end
