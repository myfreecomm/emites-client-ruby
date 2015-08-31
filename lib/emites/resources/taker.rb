module Emites
  module Resources

    # A wrapper to Emites takers API
    #
    # [API]
    #   Documentation: http://myfreecomm.github.io/emites/sandbox/v1/modules/taker.html
    #
    # @example Listing all takers:
    #   client = Emites.client("MY_SECRET_TOKEN")
    #   client.takers.list
    #
    # @example Creating an taker:
    #   client = Emites.client("MY_SECRET_TOKEN")
    #   client.takers.create({cnpj: "01001001000113"})
    #
    # @see Emites.client
    class Taker < Base

      # Creates a Taker related to the Account
      #
      # [API]
      #   Method: <tt>POST /api/v1/takers</tt>
      #
      #   Documentation: http://myfreecomm.github.io/emites/sandbox/v1/modules/taker.html#criacao
      #
      # @param params [Hash] a hash with Taker attributes
      # @return [Emites::Entities::Taker] the created Taker
      def create(params)
        http.post("/takers", { body: params }) do |response|
          respond_with_entity(response)
        end
      end

      # Retrieves a Taker by it's id
      #
      # [API]
      #   Method: <tt>GET /api/v1/takers/:id</tt>
      #
      #   Documentation: http://myfreecomm.github.io/emites/sandbox/v1/modules/taker.html#detalhes
      #
      # @param id [Integer] the Taker id
      # @return [Emites::Entities::Taker] the Taker by it's id
      def info(id)
        http.get("/takers/#{id}") do |response|
          respond_with_entity(response)
        end
      end

      # Lists all takers related to the account
      #
      # [API]
      #   Method: <tt>GET /api/v1/takers</tt>
      #
      #   Documentation: http://myfreecomm.github.io/emites/sandbox/v1/modules/taker.html#listagem
      #
      # @return [Array] an array of Taker
      def list
        http.get("/takers") do |response|
          respond_with_collection(response)
        end
      end

      # Lists all takers related to the account matching search results
      #
      # [API]
      #   Method: <tt>GET /api/v1/takers?cnpj=:cnpj</tt>
      #
      #   Documentation: http://myfreecomm.github.io/emites/sandbox/v1/modules/taker.html#filtros
      #
      # @param params [Hash] a hash with Taker attributes
      # @return [Array] an array of Taker
      def search(params)
        http.get("/takers", { params: params }) do |response|
          respond_with_collection(response)
        end
      end

      # Deletes a Taker by it's id. Returns <tt>true</true> if deletion performed well, otherwise,
      # returns <tt>false</tt>.
      #
      # [API]
      #   Method: <tt>DELETE /api/v1/takers/:id</tt>
      #
      #   Documentation: http://myfreecomm.github.io/emites/sandbox/v1/modules/taker.html#remocao
      #
      # @param id [Integer] the Taker id
      # @return [Boolean] whether deletion was performed or not
      def destroy(id)
        http.delete("/takers/#{id}") do |response|
          response.code == 204
        end
      end

      notify :create, :destroy
    end
  end
end
