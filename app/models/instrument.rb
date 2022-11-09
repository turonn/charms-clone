class Instrument < ApplicationRecord
  NULLABLE_ATTRS = %w( case_id make model serial_number year condition notes program_id )
  before_save :_nil_if_blank

  belongs_to :program
  validates_presence_of :instrument, :program

  private

  def _nil_if_blank
    NULLABLE_ATTRS.each { |attr| self[attr] = nil if self[attr].blank? }
  end
end