class BookmarkPolicy < ApplicationPolicy
  def create?
    user.present?
  end

  def show?
    create?
  end

  def edit?
    update?
  end

  def update?
    user.present? && (record.user == user)
  end

  def destroy?
    user.present? && (record.user == user)
  end
end
