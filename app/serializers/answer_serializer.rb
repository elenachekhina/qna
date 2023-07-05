class AnswerSerializer < ActiveModel::Serializer
  attributes %i[id body author_id mark created_at updated_at]
end
