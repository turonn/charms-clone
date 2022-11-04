class Instrument < ActiveRecord::Base
  belongs_to :program

  validates :instrument, presence: true
end