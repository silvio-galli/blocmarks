class TopicPolicy < ApplicationPolicy
  def new?
    user.present?
  end

  def create?
    new?
  end

  def show?
    new?
  end

  def edit?
    user.present? && record.user == user && record.bookmarks.where("user_id != ?", record.user_id) == []
  end

  def update?
    edit?
  end

  def destroy?
    edit?
  end
end
