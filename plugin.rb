# name: garmin_connect_onebox
# about: Garmin connect Onebox for embedding garmin courses
# version: 0.1
# authors: Ewan McDougall

Onebox = Onebox

module Onebox
  module Engine
    class GarminConnectOnebox
      include Engine
      REGEX = /^https?:\/\/connect\.garmin\.com\/(?:modern\/)?(course|activity)\/(?:embed\/)?([0-9]*)/
      matches_regexp REGEX

      def id
        @url.match(REGEX)[2]
      end

      def endpoint
        @url.match(REGEX)[1]
      end

      def to_html
        "<iframe width='600' height='600' frameborder='0' src='http://connect.garmin.com/#{endpoint}/embed/#{id}'></iframe>"
      end
    end
  end
end
