class Meetup < ApplicationRecord
  STEPS = [:add_meetup_time, :add_additional_info, :review]

  attr_accessor(*STEPS)

  belongs_to :host, class_name: "User"
  has_many :participations, dependent: :destroy
  has_many :users, through: :participations

  validates :date, :time, presence: true, if: :meetup_time_or_active?

  before_create :add_host_as_participant

  def self.search_by_names_of_players(query)
    joins(:users)
      .where('users.first_name ILIKE ? OR users.last_name ILIKE ?', "%#{query}%", "%#{query}%")
  end

  private

  def meetup_time_or_active?
    add_meetup_time || active?
  end

  def add_host_as_participant
    users << host
  end
end
