class User < ApplicationRecord
    EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i

    validates :first_name, :last_name, presence: true

    validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }

    # this callback will run before saving on create and update
    before_save :downcase_email

    # creating a custom instance method. self refers to the ActiveRecord object
    def full_name
        "#{self.first_name} #{self.last_name}"
    end

    private
        def downcase_email
            self.email.downcase!
        end
end
