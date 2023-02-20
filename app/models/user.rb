class User < ApplicationRecord
    has_secure_password

    validates :email, presence: true, uniqueness: true
    validates :username, presence: true, uniqueness: true
    validates :password, format: { with: /(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[^A-Za-z0-9])(?=.{8,})/ }
    
    scope :exclude_passwords, ->  { select( User.attribute_names - ['password', 'password_digest', 'password_confirmation'] ) }
    after_commit :reset_users_cache

    def reset_users_cache
        Rails.cache.delete("users_list")
    end
end
