class Topic < ActiveRecord::Base
  belongs_to :user
  has_many :bookmarks
  validates :title,
            presence: true,
            uniqueness: { case_sensitive: false }

  before_save :title_to_downcase

  private

  def title_to_downcase
    self.title = title.downcase
  end
end
