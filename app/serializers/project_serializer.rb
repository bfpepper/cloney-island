class ProjectSerializer < ActiveModel::Serializer
  attributes :title, :description, :goal
end
