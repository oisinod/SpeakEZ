class UserLanguagePolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end

  end

  def new?
    record
  end

  def create?
    record.user == user
  end
end
