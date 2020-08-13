class Groupmeetup < ApplicationRecord
  STEPS = [:add_groupmeetup_time, :add_additional_info, :review]

  attr_accessor(*STEPS)

  belongs_to :host, class_name: "User"
  belongs_to :group
  has_many :users, through: :group

  validates :date, :time, presence: true, if: :groupmeetup_time_or_active?

  def self.search_by_names_of_players(query)
    joins(:users)
      .where('users.first_name ILIKE ? OR users.last_name ILIKE ?', "%#{query}%", "%#{query}%")
  end

  private

  def groupmeetup_time_or_active?
    add_groupmeetup_time || active?
  end
end
