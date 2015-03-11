module Emites
  module Resources
    class Emitter < Base

      def create(params)
        http.post("/emitters") do |response|
          build_collection(response)
        end
      end

      def list
        http.get("/emitters") do |response|
          build_collection(response)
        end
      end

      def search(params)
        http.get("/emitters") do |response|
          build_collection(response)
        end
      end

      def show(id)
        http.get("/emitters") do |response|
          build_entity(response)
        end
      end

      def update(params)
        http.update("/emitters") do |response|
          build_entity(response)
        end
      end

      def partial_update(params)
        http.patch("/emitters") do |response|
          build_entity(response)
        end
      end

      def destroy(id)
        http.delete("/emitters") do |response|
          build_collection(response)
        end
      end

      def series
        http.get("/emitters/series") do |response|
          build_collection(response)
        end
      end

    end
  end
end