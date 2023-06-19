# frozen_string_literal: true

class AnswerPolicy < ApplicationPolicy

  def index?
    true
  end

  def show?
    true
  end

  def create?
    user
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

  def mark?
    user&.id == record.question.author_id
  end

end
