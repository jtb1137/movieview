class User < ActiveRecord::Base
    has_secure_password

    def slug
        @slug = self.username.downcase.gsub(/[^a-z0-9]+/, '-')
    end

    def self.find_by_slug(slug)
        self.all.detect { |user| user.slug === slug }
    end
end