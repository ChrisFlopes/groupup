class Group < ApplicationRecord
  STEPS = [:add_additional_info, :review]

  attr_accessor(*STEPS)

  belongs_to :host, class_name: "User"
  has_many :members, dependent: :destroy
  has_many :users, through: :members

  before_create :add_host_as_member

  def self.search_by_names_of_players(query)
    joins(:users)
      .where('users.first_name ILIKE ? OR users.last_name ILIKE ?', "%#{query}%", "%#{query}%")
  end

  private

  def add_host_as_member
    users << host
  end
end
