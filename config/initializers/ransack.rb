# config/initializers/ransack.rb
Ransack.configure do |config|
  config.add_predicate 'default_safe', arel_predicate: 'matches'

  # Override default searchable attributes for all models
  ActiveRecord::Base.class_eval do
    def self.ransackable_attributes(auth_object = nil)
      column_names - %w[encrypted_password password_reset_token reset_password_token owner]
    end

    def self.ransackable_associations(auth_object = nil)
      reflect_on_all_associations.map(&:name).map(&:to_s)
    end
  end
end
