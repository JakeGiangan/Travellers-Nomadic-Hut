module SearchHelper
  def check_if_filled?(item)
    item.present? && item.empty? == false
  end
end
