module Studinsight
  class Apartment < ::Apartment::Elevators::Subdomain
    def call(env)
      super
    rescue ::Apartment::TenantNotFound
      [302, {'Location' => '/'}, []]
    end
  end
end