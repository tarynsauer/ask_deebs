module UsersHelper
  def is_following?(question_id)
    current_user.followed_questions.where(id: question_id).count > 0
  end
end