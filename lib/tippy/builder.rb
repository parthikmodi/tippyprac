module Tippy
  class Builder
    def initialize total:, gratuity:
      @total = total
      @gratuity = gratuity
    end

    def generate
      return calcution if number_based?
      string_based
    end

    def number_based?
      (@gratuity.is_a? Numeric) || (@gratuity.integer?)
    end

    def string_based?
      case @gratuity.downcase
      when 'high' then calcution 25
      when 'standard' then calcution 18
      when 'low' then calcution 10
    end

    def calcution gratuity = @gratuity
      @total += @total * (gratuity.to_f /100)
    end
  end
end
