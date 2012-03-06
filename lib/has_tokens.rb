require "has_tokens/version"

module HasTokens

  def self.on(klass)
    klass.class_eval do
      include HasTokens
      class << self
        attr_reader :token_definitions

        def has_tokens(token_definitions)
          @token_definitions = token_definitions
          token_definitions.keys.each do |token_name|
            define_singleton_method "for_#{token_name}" do |token|
              send "find_by_#{token_name}_token!", token
            end
          end
        end
      end
    end
  end

  TokenChars = (1..9).to_a + ('a'..'z').to_a

  def generate_tokens
    self.class.token_definitions.each do |token_name, size|
      return if self.send("#{token_name}_token")
      self.send "#{token_name}_token=", (1..size).map{TokenChars.sample}.join
    end
  end
end
