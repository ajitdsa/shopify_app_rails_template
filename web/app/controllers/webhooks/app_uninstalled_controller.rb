# frozen_string_literal: true

module Webhooks
  # controller for when app is uninstalled
  class AppUninstalledController < ApplicationController
    include ShopifyApp::WebhookVerification

    def receive
      webhook_request = ShopifyAPI::Webhooks::Request.new(raw_body: request.raw_post, headers: request.headers.to_h)
      AppUninstalledJob.perform_later(shop_domain: webhook_request.shop, webhook: webhook_request.parsed_body)
      head(:no_content)
    end
  end
end
