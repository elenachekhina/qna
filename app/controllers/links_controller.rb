class LinksController < ApplicationController
  before_action :setup_linkable

  private

  def setup_linkable
    Rails.logger.debug(params)
    @linkable = linkable.new(links: [Link.new])
  end

  def linkable
    params.each do |name, value|
      if Object.const_defined?(name.classify)
        if name.classify.constantize.respond_to?(:reflect_on_association)
          if name.classify.constantize.reflect_on_association(:links)
            return name.classify.constantize
          end
        end
      end
      nil
    end
  end


end
