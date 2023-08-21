Rack::Attack.throttle("requests by ip", limit: 10, period: 5.minutes) do |request|
    if request.path === '/auth/login'
        request.ip
    end
end

Rack::Attack.throttled_responder = lambda do |request|
    # Using 503 because it may make attacker think that they have successfully
    # DOSed the site. Rack::Attack returns 403 for blocklists by default
    [ 503, {}, ['Blocked']]
end