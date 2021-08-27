class CommentSerializer
  include FastJsonapi::ObjectSerializer
  attributes :text, :ad_id, :user_id
end
