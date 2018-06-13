require_dependency 'issue'

module IssuePatch
  def self.included(base)
    base.extend(ClassMethods)

    base.send(:include, InstanceMethods)

    base.class_eval do
      unloadable

      base.has_and_belongs_to_many :releases

    end
  end

  module ClassMethods
  end

  module InstanceMethods
  end
end

ActionDispatch::Callbacks.to_prepare do
  Issue.send(:include, IssuePatch)
end
