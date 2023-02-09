module Callable
  extend ActiveSupport::Concern
  class_methods do
    def call(*args)
      service = new(*args)
      service.call
      service
    end
  end

  def success?
    errors.nil?
  end

  def errors
    @errors
  end

  def t(key)
    I18n.t(key, scope: self.class.name.underscore.split("/"))
  end

  def add_error(object, attribute = nil, type = nil)
    @errors ||= []
    if object.present?
      object.errors.each do |err|
        @errors << { attribute: err.attribute, message: t(err.type) }
      end
    else
      @errors << { attribute: attribute, type: t(type) }
    end
  end
end
