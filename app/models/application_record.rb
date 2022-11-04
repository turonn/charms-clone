class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  private

  def _nil_if_blank
    NULLABLE_ATTRS.each { |attr| self[attr] = nil if self[attr].blank? }
  end
end
