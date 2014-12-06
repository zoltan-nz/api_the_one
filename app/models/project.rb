class Project
  include BaseModel
  field :title, type: String

  validates :title, presence: true

  has_many :todos
  has_many :users
end
