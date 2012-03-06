require "has_tokens/version"

module HasTokens
  def self.on(klass)
    def klass.has_tokens(token_definitions)
    end

    klass.send :include, self
  end

  def generate_tokens
    self.public_token = Object.new
  end
end
