module Emites
  module Resources

    # A wrapper to Emites webhooks API
    #
    # [API]
    #   Documentation: http://myfreecomm.github.io/emites/sandbox/v1/modules/webhooks.html
    #
    # @example Listing all webhooks:
    #   client = Emites.client("MY_SECRET_TOKEN")
    #   client.webhooks.list
    #
    # @example Creating an webhook:
    #   client = Emites.client("MY_SECRET_TOKEN")
    #   client.webhooks.create({name: "My Fake Web Hook", url: "http://web.hook")
    #
    # @see Emites.client
    class Webhook < Base

      # Lists all Webhooks related to the account
      #
      # [API]
      #   Method: <tt>GET /api/v1/webhooks</tt>
      #
      #   Documentation: http://myfreecomm.github.io/emites/sandbox/v1/modules/webhooks.html#listagem
      #
      # @return [Array] an array of Webhook
      def list
        http.get("/webhooks") do |response|
          respond_with_collection(response)
        end
      end

      # Updates an Webhook identified by <tt>id</tt>
      #
      # [API]
      #   Method: <tt>PUT /api/v1/webhooks/:id</tt>
      #
      #   Documentation: http://myfreecomm.github.io/emites/sandbox/v1/modules/webhooks.html#atualizacao
      #
      # @param id [Integer] the webhook id
      # @param params [Hash] a hash with new data
      # @return [Array] an array of Webhook
      def update(id, params)
        http.put("/webhooks/#{id}", {body: params}) do |response|
          respond_with_entity(response)
        end
      end

      # Deletes an Webhook by it's id. Returns <tt>true</true> if deletion performed well, otherwise,
      # returns <tt>false</tt>.
      #
      # [API]
      #   Method: <tt>DELETE /api/v1/webhooks/:id</tt>
      #
      #   Documentation: http://myfreecomm.github.io/emites/sandbox/v1/modules/webhooks.html#remocao
      #
      # @param id [Integer] the Wehook id
      # @return [Boolean] whether deletion was performed or not
      def destroy(id)
        http.delete("/webhooks/#{id}") do |response|
          response.code == 204
        end
      end

      # Creates an Webhook
      #
      # [API]
      #   Method: <tt>POST /api/v1/webhooks</tt>
      #
      #   Documentation: http://myfreecomm.github.io/emites/sandbox/v1/modules/webhooks.html#criacao
      #
      # @param params [Hash] a hash with Webhook attributes
      # @return [Emites::Entities::Webhook] the created Webhook
      def create(params)
        http.post("/webhooks", { body: params }) do |response|
          respond_with_entity(response)
        end
      end

    end
  end
end