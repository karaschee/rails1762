module Console::ConsoleBaseHelper
  def render_form_action(obj)
    obj.new_record? ? "新建" : "编辑"
  end
end
