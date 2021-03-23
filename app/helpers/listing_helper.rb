module ListingHelper
  def is_ready_to_publish(listing)
    listing.address.present? && listing.listing_description.present? && listing.listing_name.present? && listing.price.present?
  end

  def is_filled?(entry)
    if entry.present?
      content_tag :i, nil, class: 'fa fa-check text-success'
    else
      content_tag :i, nil, class: 'fa fa-times text-danger'
    end
  end
end
