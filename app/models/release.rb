class Release < ActiveRecord::Base
  has_and_belongs_to_many :issues
  belongs_to :project

  def open?
    status == 'open'
  end
end
