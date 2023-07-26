class Bar < ApplicationRecord
  def friendly_created_at
    created_at.strftime("%B %e, %Y")
  end

  def delivered_total
    price + 50
  end
end
