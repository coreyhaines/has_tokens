require "has_tokens/version"

module HasTokens
  def self.on(klass)
    def klass.has_tokens(token_definitions)
    end

    klass.send :include, self
  end

  TokenChars = (1..9).to_a + ('a'..'z').to_a
  def generate_tokens
    self.public_token = (1..5).map{TokenChars.sample}.join
  end
end
