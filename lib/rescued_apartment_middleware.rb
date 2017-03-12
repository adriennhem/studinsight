class RescuedApartmentMiddleware < ::Apartment::Elevators::Subdomain
  def call(env)
      super
    rescue ::Apartment::TenantNotFound
	  # raise ActionController::RoutingError.new('Not Found')
      return [404, {"Content-Type" => "text/html"}, ["Not Found"]]
 end
end