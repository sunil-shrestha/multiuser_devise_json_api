module MultiuserDevise
  class UserPolicy < ApplicationPolicy
    def create?
      true
    end

    def create_session?
      true
    end

    def show?
      resource_is_self || resource_is_admin?
    end

    def update?
      resource_is_self || resource_is_admin?
    end

    def resource_is_self
      resource.present? && resource.class == record.class && resource.id == record.id
    end

    class Scope < Scope
      def resolve
        scope
      end
    end

  end
end
