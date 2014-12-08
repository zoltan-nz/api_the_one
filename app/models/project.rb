class Project
  include BaseModel
  field :title, type: String

  validates :title, presence: true

  has_many :todos
  belongs_to :user
end
