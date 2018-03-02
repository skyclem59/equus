class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  
  def new?
    true
  end

  def create?
    return true
  end

  def validate?
    record.horse.user == user
  end

  def update?
    record.horse.user == user
  end

  def destroy?
    record.user == user
  end
end
