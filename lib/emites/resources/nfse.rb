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
      # @return [Array] an array of Webhook
      def list
        http.get("/nfse") do |response|
          respond_with_collection(response)
        end
      end

    end
  end
end