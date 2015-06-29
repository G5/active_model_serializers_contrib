class ActiveModel::PaginationSerializer < ActiveModel::ArraySerializer

  def initialize_with_pagination(object, opts={})
    per_page = object.limit_value
    offset = object.offset_value
    current_page = offset ? (offset / per_page) + 1 : 1
    total_objects = object.limit(nil).offset(nil).count
    total_pages = per_page ? (total_objects / per_page).ceil : 1
    prev_page = current_page - 1
    prev_page = nil if prev_page < 1
    next_page = current_page + 1
    next_page = nil if next_page > total_pages

    opts[:meta] ||= {}
    opts[:meta][:current_page] = current_page
    opts[:meta][:total_pages] = total_pages
    opts[:meta][:total] = total_objects
    opts[:meta][:prev_page] = prev_page
    opts[:meta][:next_page] = next_page

    initialize_without_pagination(object, opts)
  end

  alias_method_chain :initialize, :pagination

end
