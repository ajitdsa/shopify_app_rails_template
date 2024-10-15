# frozen_string_literal: true

# rubocop:disable Lint/UnusedMethodArgument

# job to perform when app is uninstalled
class AppUninstalledJob < ApplicationJob
  def perform(shop_domain:, webhook:)
    shop = Shop.find_by(shopify_domain: shop_domain)

    if shop.nil?
      logger.error("#{self.class} failed: cannot find shop with domain '#{shop_domain}'")
      return
    end

    logger.info("#{self.class} started for shop '#{shop_domain}'")
    shop.destroy
  end
end
# rubocop:enable Lint/UnusedMethodArgument
