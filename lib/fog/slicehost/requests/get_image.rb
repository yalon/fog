unless Fog.mocking?

  module Fog
    class Slicehost

      # Get details of an image
      #
      # ==== Parameters
      # * image_id<~Integer> - Id of image to lookup
      #
      # ==== Returns
      # * response<~Excon::Response>:
      #   * body<~Array>:
      #     * 'id'<~Integer> - Id of the image
      #     * 'name'<~String> - Name of the image
      def get_image(image_id)
        request(
          :expects  => 200,
          :method   => 'GET',
          :parser   => Fog::Parsers::Slicehost::GetImage.new,
          :path     => "images/#{image_id}.xml"
        )
      end

    end
  end

else

  module Fog
    class Slicehost

      def get_image(image_id)
        raise MockNotImplemented.new("Contributions welcome!")
      end

    end
  end

end