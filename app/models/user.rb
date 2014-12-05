class User
  include BaseModel
  field :name, type: String

  belongs_to :project
  has_many :todos
end
