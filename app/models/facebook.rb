class Facebook < ActiveRecord::Base
    # Returns the oath_token for the SMART user. TODO: use SMART token.
    # ==== Notes
    #
    # Go to Facebook Graph API Explorer to generate for a specific user:
    # https://developers.facebook.com/tools/explorer
    def oauth_token
        "CAACEdEose0cBAC32GWdEsZAdLh7VDUAc7rv5Rfuf13tuJ5NOLHMTZBvqwiLc7HOLjS9rq3N3D8xp2NsInbNmD42ib2hSs9vJ4enZCCPhMvb3efHEm78E2lk8dOyY8jy6GNM3mTZBbHLC8UT04ld3fb39tSvv4XyBkZAyEM8mQF3bz0xOCQn6edF4CYTkVJbtrWLwOZBJJuVgZDZD"
    end

    # Returns a Koala API handle to the Facebook session.
    # ==== Optional Parameters
    #
    # * +bust_cache+ - Force a bust of the the cached connection (default false)
    def get_cached_connection(bust_cache = false)
        if bust_cache
            logger.info "Busting Facebook sessions cache..."
            facebook = Koala::Facebook::API.new(oauth_token)
        else
            facebook ||= Koala::Facebook::API.new(oauth_token)
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
    def get_active_connection
        facebook = get_cached_connection

        begin
            facebook.get_object("me")
        rescue
            facebook = self.get_cached_connection(bust_cache = true)
        end

        facebook
    end
end
