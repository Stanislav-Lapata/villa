module Api
  class FaqsController < BaseController
    def index
      @faqs = Faq.all
    end
  end
end
