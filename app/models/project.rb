class Project
  include BaseModel
  field :title, type: String

  has_many :todos
  has_many :users
end
