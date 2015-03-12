module Emites
  module Resources
    class Emitter < Base

      def create(params)
        http.post("/emitters", { body: params }) do |response|
          respond_with_entity(response)
        end
      end

      def info(id)
        http.get("/emitters/#{id}") do |response|
          respond_with_entity(response)
        end
      end

      def list
        http.get("/emitters") do |response|
          respond_with_collection(response)
        end
      end

      def search(params)
        http.get("/emitters", {params: params}) do |response|
          respond_with_collection(response)
        end
      end

      def destroy(id)
        http.delete("/emitters/#{id}") do |response|
          response.code == 204
        end
      end
    end
  end
end
