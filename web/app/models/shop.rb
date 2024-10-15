# frozen_string_literal: true

# shop class
class Shop < ApplicationRecord
  include ShopifyApp::ShopSessionStorageWithScopes

  def api_version
    ShopifyApp.configuration.api_version
  end
end
