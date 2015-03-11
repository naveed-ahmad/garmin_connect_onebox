# name: garmin_connect_onebox
# about: Garmin connect Onebox for embedding garmin courses
# version: 0.1
# authors: Ewan McDougall

Onebox = Onebox

module Onebox
  module Engine
    class GarminConnectOnebox

      include Engine

      matches_regexp /^https?:\/\/connect\.garmin\.com\/(?:modern\/)?(course|activity)\/(?:embed\/)?([0-9]*)/

      def id
        match[2]
      end

      def endpoint
        match[1]
      end

      def iframe_height
        endpoint == 'activity' ? 280 : 600
      end

      def to_html
        "<iframe width='600' height='#{iframe_height}' frameborder='0' src='http://connect.garmin.com/#{endpoint}/embed/#{id}'></iframe>"
      end

      def placeholder_html
        "<div class='garmin-preview-placeholder garmin-#{endpoint}'>Your #{endpoint}'s preview will be shown here</div>"
      end

      def match
        @match ||= @url.match(@@matcher)
      end
    end
  end
end



register_css <<CSS
.garmin-preview-placeholder{
    border: 4px solid #777;
    border-radius: 3px;
    width: 90%;
    height: 25px;
    text-align: center;
    padding: 20px 0;
 }

CSS
