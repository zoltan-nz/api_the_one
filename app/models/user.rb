class User
  include BaseModel

  field :email, type: String, default: ''
  field :encrypted_password, type: String, default: ''

  belongs_to :project
  has_many :todos
end
