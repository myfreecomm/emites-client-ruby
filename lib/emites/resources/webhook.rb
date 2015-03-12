module Emites
  module Resources
    class Webhook < Base

      def list
        http.get("/webhooks") do |response|
          respond_with_collection(response)
        end
      end

      def update(id, params)
        http.put("/webhooks/#{id}", {body: params}) do |response|
          respond_with_entity(response)
        end
      end

      def destroy(id)
        http.delete("/webhooks/#{id}") do |response|
          response.code == 204
        end
      end

    end
  end
end