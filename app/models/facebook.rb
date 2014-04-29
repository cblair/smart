class Facebook < ActiveRecord::Base

    # Returns a Koala API handle to the Facebook session.
    # ==== Optional Parameters
    #
    # * +bust_cache+ - Force a bust of the the cached connection (default false)
    def get_cached_connection(current_user, bust_cache = false)
        if bust_cache
            logger.info "Busting Facebook sessions cache..."
            facebook = Koala::Facebook::API.new(current_user.oauth_token)
        else
            facebook ||= Koala::Facebook::API.new(current_user.oauth_token)
        end

        facebook
    end

    # Returns the cached or new Koala API connection.
    #
    # ==== Notes
    # According to Facebook Graph API:
    # "Short-lived tokens usually have a lifetime of about an hour or two,
    # while long-lived tokens usually have a lifetime of about 60 days."
    # This method will test the cached connection, and if it fails, assumes it's
    # expired and busts the cache or a new one.
    def get_active_connection(current_user)
        facebook = get_cached_connection(current_user)

        begin
            facebook.get_object("me")
        rescue
            facebook = self.get_cached_connection(current_user, bust_cache = true)
        end

        facebook
    end
end
