module Emites
  module Resources
    class Emitter < Base

      def list
        http.get("/emitters") do |response|
          build_collection(response)
        end
      end

      def search(params)
        http.get("/emitters", {params: params}) do |response|
          build_collection(response)
        end
      end

      def show(id)
        http.get("/emitters/#{id}") do |response|
          build_entity(response)
        end
      end

      def destroy(id)
        http.delete("/emitters/#{id}")
      end

    end
  end
end