class StudentSerializer < ActiveModel::Serializer
  # belongs_to :instructor
  attributes :id, :name, :major, :age
end
