# frozen_string_literal: true

class QuestionPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def create?
    user.present?
  end

  def new?
    create?
  end

  def update?
    user&.id == record.author_id
  end

  def edit?
    update?
  end

  def destroy?
    user&.id == record.author_id
  end
end
