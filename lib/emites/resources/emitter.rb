module Emites
  module Resources

    # A wrapper to Emites emitters API
    #
    # [API]
    #   Documentation: http://myfreecomm.github.io/emites/sandbox/v1/modules/emitter.html
    #
    # @example Listing all emitters:
    #   client = Emites.client("MY_SECRET_TOKEN")
    #   client.emitters.list
    #
    # @example Creating an emitter:
    #   client = Emites.client("MY_SECRET_TOKEN")
    #   client.emitters.create({cnpj: "01001001000113", certificate: Base64.encode64(File.read("path/to/certificate.pfx"))})
    #
    # @see Emites.client
    class Emitter < Base

      # Creates an Emitter related to the Account
      #
      # [API]
      #   Method: <tt>POST /api/v1/emitters</tt>
      #
      #   Documentation: http://myfreecomm.github.io/emites/sandbox/v1/modules/emitter.html#criacao
      #
      # @param params [Hash] a hash with Emitter attributes
      # @return [Emites::Entities::Emitter] the created Emitter
      def create(params)
        http.post("/emitters", { body: params }) do |response|
          respond_with_entity(response)
        end
      end

      # Retrieves an Emitter by it's id
      #
      # [API]
      #   Method: <tt>GET /api/v1/emitters/:id</tt>
      #
      #   Documentation: http://myfreecomm.github.io/emites/sandbox/v1/modules/emitter.html#detalhes
      #
      # @param id [Integer] the Emitter id
      # @return [Emites::Entities::Emitter] the Emitter by it's id
      def info(id)
        http.get("/emitters/#{id}") do |response|
          respond_with_entity(response)
        end
      end

      # Lists all Emitters related to the account
      #
      # [API]
      #   Method: <tt>GET /api/v1/emitters</tt>
      #
      #   Documentation: http://myfreecomm.github.io/emites/sandbox/v1/modules/emitter.html#listagem
      #
      # @return [Array] an array of Emitter
      def list
        http.get("/emitters") do |response|
          respond_with_collection(response)
        end
      end

      # Lists all Emitters related to the account matching search results
      #
      # [API]
      #   Method: <tt>GET /api/v1/emitters?cnpj=:cnpj</tt>
      #
      #   Documentation: http://myfreecomm.github.io/emites/sandbox/v1/modules/emitter.html#filtros
      #
      # @param params [Hash] a hash with Emitter attributes
      # @return [Array] an array of Emitter
      def search(params)
        http.get("/emitters", {params: params}) do |response|
          respond_with_collection(response)
        end
      end

      # Deletes an Emitter by it's id. Returns <tt>true</true> if deletion performed well, otherwise,
      # returns <tt>false</tt>.
      #
      # [API]
      #   Method: <tt>DELETE /api/v1/emitters/:id</tt>
      #
      #   Documentation: http://myfreecomm.github.io/emites/sandbox/v1/modules/emitter.html#remocao
      #
      # @param id [Integer] the Emitter id
      # @return [Boolean] whether deletion was performed or not
      def destroy(id)
        http.delete("/emitters/#{id}") do |response|
          response.code == 204
        end
      end
    end
  end
end
