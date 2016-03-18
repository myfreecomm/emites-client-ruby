module Emites
  module Resources

    # A wrapper to Emites services API
    #
    # [API]
    #   Documentation: http://myfreecomm.github.io/emites/sandbox/v1/modules/service_values.html
    #
    # @example Listing all services:
    #   client = Emites.client("MY_SECRET_TOKEN")
    #   client.services.list
    #
    # @example Creating a service:
    #   client = Emites.client("MY_SECRET_TOKEN")
    #   client.services.create({emitter_id: 1, name: "Serviço"})
    #
    # @see Emites.client
    class Service < Base

      # Creates a Service related to the Account
      #
      # [API]
      #   Method: <tt>POST /api/v1/service-values</tt>
      #
      #   Documentation: http://myfreecomm.github.io/emites/sandbox/v1/modules/service_values.html#criacao
      #
      # @param params [Hash] a hash with Service attributes
      # @return [Emites::Entities::Service] the created Service
      def create(params)
        http.post("/service-values", { body: params }) do |response|
          respond_with_entity(response)
        end
      end

      # Retrieves a Service by it's id
      #
      # [API]
      #   Method: <tt>GET /api/v1/service-values/:id</tt>
      #
      #   Documentation: http://myfreecomm.github.io/emites/sandbox/v1/modules/service_values.html#detalhes
      #
      # @param id [Integer] the Service id
      # @return [Emites::Entities::Service] the Service by it's id
      def info(id)
        http.get("/service-values/#{id}") do |response|
          respond_with_entity(response)
        end
      end

      # Lists all services related to the account
      #
      # [API]
      #   Method: <tt>GET /api/v1/service-values</tt>
      #
      #   Documentation: http://myfreecomm.github.io/emites/sandbox/v1/modules/service_values.html#listagem
      #
      # @return [Array] an array of Service
      def list
        http.get("/service-values") do |response|
          respond_with_collection(response)
        end
      end

      # Lists all services related to the account matching search results
      #
      # [API]
      #   Method: <tt>GET /api/v1/service-values?name=:name</tt>
      #
      #   Documentation: http://myfreecomm.github.io/emites/sandbox/v1/modules/service_values.html#filtros
      #
      # @param params [Hash] a hash with Service attributes
      # @return [Array] an array of Service
      def search(params)
        http.get("/service-values", { params: params }) do |response|
          respond_with_collection(response)
        end
      end

      # Deletes a Service by it's id. Returns <tt>true</true> if deletion performed well, otherwise,
      # returns <tt>false</tt>.
      #
      # [API]
      #   Method: <tt>DELETE /api/v1/service-values/:id</tt>
      #
      #   Documentation: http://myfreecomm.github.io/emites/sandbox/v1/modules/service_values.html#remocao
      #
      # @param id [Integer] the Service id
      # @return [Boolean] whether deletion was performed or not
      def destroy(id)
        http.delete("/service-values/#{id}") do |response|
          response.code == 204
        end
      end

      # Calculates the liquid amount based on service
      #
      # [API]
      #   Method: <tt>POST /api/v1/service-values/:id/calculation-liquid-amount</tt>
      #
      #   Documentation: http://myfreecomm.github.io/emites/sandbox/v1/modules/service_values.html#calculo-de-valor-liquido-da-nfse
      #
      # @param id [Integer] the Service id
      # @param params [Hash] a hash with Service service_amount
      # @return [Emites::Entities::Service] the Service with calculated liquid amount
      def calculate_liquid_amount(id, params)
        http.post("/service-values/#{id}/calculation-liquid-amount", { body: params }) do |response|
          respond_with_entity(response)
        end
      end

      notify :create, :destroy
    end
  end
end
