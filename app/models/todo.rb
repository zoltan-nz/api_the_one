# Representation of the permission state
class Todo
  include BaseModel

  field :name,  type: String
  field :ready, type: Boolean

  validates :name, presence: true

  belongs_to :project
  belongs_to :user
end
