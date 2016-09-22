module Emites
  module Resources

    # A wrapper to Emites NFSes API
    #
    # [API]
    #   Documentation: http://myfreecomm.github.io/emites/v1/modules/nfse.html
    #
    # @example Listing all NFSe:
    #   client = Emites.client("MY_SECRET_TOKEN")
    #   client.nfse.list
    #
    # @example Creating a NFSe:
    #   client = Emites.client("MY_SECRET_TOKEN")
    #   client.nfse.create({emitter_id: 1, serie: "a", ...)
    #
    # @see Emites.client
    class Nfse < Base

      # Lists all NFSes
      #
      # [API]
      #   Method: <tt>GET /api/v1/nfse</tt>
      #
      #   Documentation: http://myfreecomm.github.io/emites/v1/modules/nfse.html#listagem
      #
      # @return Emites::Entities::Collection a collection of Emites::Entities::Nfse
      def list
        http.get("/nfse") do |response|
          respond_with_collection(response)
        end
      end

      # Lists all NFSes matching search parameters
      #
      # [API]
      #   Method: <tt>GET /api/v1/nfse?status=:status&page=:page</tt>
      #
      #   Documentation: http://myfreecomm.github.io/emites/v1/modules/nfse.html#filtros
      #
      # @param params [Hash] an optional hash with filter parameters
      # @return Emites::Entities::Collection a collection of Emites::Entities::Nfse
      def search(params = {})
        http.get("/nfse", params: filter(params)) do |response|
          respond_with_collection(response)
        end
      end

      # Retrieves a Nfse by it's id
      #
      # [API]
      #   Method: <tt>GET /api/v1/nfse/:id</tt>
      #
      #   Documentation: http://myfreecomm.github.io/emites/sandbox/v1/modules/nfse.html#detalhes
      #
      # @param id [Integer] the Nfse id
      # @return [Emites::Entities::Nfse] the Nfse by it's id
      def info(id)
        http.get("/nfse/#{id}") do |response|
          respond_with_entity(response)
        end
      end

      # Retrieves a Nfse status by it's id
      #
      # [API]
      #   Method: <tt>GET /api/v1/nfse/:id/status</tt>
      #
      #   Documentation: http://myfreecomm.github.io/emites/sandbox/v1/modules/nfse.html#status
      #
      # @param id [Integer] the Nfse id
      # @return [Emites::Entities::NfseStatus] the NfseStatus by it's id
      def status(id)
        http.get("/nfse/#{id}/status") do |response|
          respond_with_entity(response, Entities::NfseStatus)
        end
      end

      # Retrieves the entire Nfse status history by it's id
      #
      # [API]
      #   Method: <tt>GET /api/v1/nfse/:id/history</tt>
      #
      #   Documentation: http://myfreecomm.github.io/emites/sandbox/v1/modules/nfse.html#historico
      #
      # @param id [Integer] the Nfse id
      # @return Emites::Entities::Collection a collection of Emites::Entities::NfseStatusTransition
      def history(id)
        http.get("/nfse/#{id}/history") do |response|
          respond_with_collection(response, Entities::NfseStatusTransition)
        end
      end

      # Retrieves Nfse PDF url
      #
      # [API]
      #   Method: <tt>GET /api/v1/nfse/:id/pdf</tt>
      #
      #   Documentation: http://myfreecomm.github.io/emites/sandbox/v1/modules/nfse.html#pdf
      #
      # @param id [Integer] the Nfse id
      # @return [String] the url to redirect or an empty string if an error occurred
      def pdf(id)
        http.get("/nfse/#{id}/pdf") do |response|
          response.headers.fetch("Location") { "" }
        end
      end

      # Retrieves Nfse XML url
      #
      # [API]
      #   Method: <tt>GET /api/v1/nfse/:id/xml</tt>
      #
      #   Documentation: http://myfreecomm.github.io/emites/sandbox/v1/modules/nfse.html#xml
      #
      # @param id [Integer] the Nfse id
      # @return [String] the url to redirect or an empty string if an error occurred
      def xml(id)
        http.get("/nfse/#{id}/xml") do |response|
          response.headers.fetch("Location") { "" }
        end
      end

      # Cancels a Nfse by it's id
      #
      # [API]
      #   Method: <tt>POST /api/v1/nfse/:id/cancel</tt>
      #
      #   Documentation: http://myfreecomm.github.io/emites/sandbox/v1/modules/nfse.html#cancelamento
      #
      # @param id [Integer] the Nfse id
      # @return [Emites::Entities::NfseStatus] the NfseStatus by it's id
      def cancel(id)
        http.post("/nfse/#{id}/cancel") do |response|
          respond_with_entity(response, Entities::NfseStatus)
        end
      end

      # Deletes a Nfse by it's id
      #
      # [API]
      #   Method: <tt>DELETE /api/v1/nfse/:id</tt>
      #
      #   Documentation: http://myfreecomm.github.io/emites/sandbox/v1/modules/nfse.html#remocao
      #
      # @param id [Integer] the Nfse id
      # @return [Boolean] whether deletion was performed or not
      def destroy(id)
        http.delete("/nfse/#{id}") do |response|
          response.code == 204
        end
      end

      # Creates an Nfse
      #
      # [API]
      #   Method: <tt>POST /api/v1/nfse</tt>
      #
      #   Documentation: http://myfreecomm.github.io/emites/sandbox/v1/modules/nfse.html#criacao
      #
      # @param params [Hash] a hash with Nfse attributes
      # @return [Emites::Entities::Nfse] the created Nfse
      def create(params)
        http.post("/nfse", { body: params }) do |response|
          respond_with_entity(response)
        end
      end

      # Updates an Nfse
      #
      # [API]
      #   Method: <tt>PUT /api/v1/:id</tt>
      #
      #   Documentation: http://myfreecomm.github.io/emites/sandbox/v1/modules/nfse.html#atualizacao-parcial-e-completa
      #
      # @param id [Integer] the Nfse id
      # @param params [Hash] a hash with Nfse attributes
      # @return [Emites::Entities::Nfse] the created Nfse
      def update(id, params)
        http.put("/nfse/#{id}", { body: params }) do |response|
          respond_with_entity(response)
        end
      end

      notify :create, :update, :cancel, :destroy

      private

      PERMITTED_PARAMS = %W(
        status
        emitter_id
        nfse_key
        emission_date_lte
        emission_date_gte
        number
        nfse_number
        amount_lte
        amount_gte
        taker_social_reason
        taker_cpf
        taker_cnpj
        is_complete
        serie,
        page
      )

      def filter(params)
        Emites::Params.new(params).permit(PERMITTED_PARAMS)
      end
    end
  end
end
