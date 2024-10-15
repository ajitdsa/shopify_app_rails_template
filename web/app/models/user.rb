# frozen_string_literal: true

# user class
class User < ApplicationRecord
  include ShopifyApp::UserSessionStorageWithScopes

  def api_version
    ShopifyApp.configuration.api_version
  end
end
