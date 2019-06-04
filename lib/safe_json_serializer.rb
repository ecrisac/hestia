module SafeJSONSerializer
  def load(source, proc = nil, options = {})
    # we use parse, because load is unsafe
    json = JSON.parse(source, quirks_mode: true)
    if json.is_a?(Hash) && json['flash']
      flash = ActionDispatch::Flash::FlashHash.new
      flash.update(json.delete('flash').to_h.with_indifferent_access.symbolize_keys)
      json['flash'] = flash
    end
    json
  end

  module_function :load

  def dump(obj, anIO = nil, limit = nil)
    obj.to_json
  end

  module_function :dump
end
