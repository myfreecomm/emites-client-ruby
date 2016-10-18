module Emites

  class Params
    def initialize(attributes = {})
      @attributes = symbolize_keys(attributes)
    end

    def permit(filters)
      filters.map(&:to_sym).each_with_object(Hash.new) do |key, result|
        result[key] = @attributes[key] if @attributes.has_key?(key)
      end
    end

    private

    def symbolize_keys(hash)
      Hash[hash.map { |key,value| [key.to_sym, value] }]
    end
  end
end
