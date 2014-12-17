# Base class for all serializers
class BaseSerializer
  def initialize(record)
    @record = record
  end

  class << self
    attr_reader :defined_attributes

    def attributes(*attributes)
      @defined_attributes = attributes.map(&:to_sym)
    end
  end

  def serialize(options = {})
    json = attributes(options)
    options.fetch(:root, true) ? { root => json } : json
  end

  protected

  def attributes(_options = {})
    json = record_slice(*self.class.defined_attributes)
    json['id'] = @record.id.to_s
    json
  end

  def record_slice(*attributes)
    hash = @record.attributes.with_indifferent_access
    hash.slice(*attributes)
  end

  def root
    self.class.to_s.sub('Serializer', '').underscore
  end
end
