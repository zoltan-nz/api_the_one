class User
  include BaseModel

  field :email, type: String, default: ''
  field :encrypted_password, type: String, default: ''

  has_many :projects
  has_many :todos
end
