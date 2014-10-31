# Mixin for all mongoid based models
module BaseModel
  extend ActiveSupport::Concern

  included do
    include Mongoid::Document
    include Mongoid::Timestamps

    def serializer
      @serializer ||= default_serializer
    end

    def as_json(options = {})
      serializer ? serializer.serialize(options) : super(options)
    end

    private

    def default_serializer
      (self.class.to_s + 'Serializer').constantize.new(self)
    rescue NameError
      nil
    end
  end
end
