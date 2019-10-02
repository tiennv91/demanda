module Types
  class CategoryType < Types::BaseObject
    field :id, String, null: false, method: :uuid
    field :name, String, null: false
    field :parent, Types::CategoryType, null: true
    field :children, [Types::CategoryType], null: true
  end
end
