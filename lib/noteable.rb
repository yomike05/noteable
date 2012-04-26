require 'noteable/engine'

module Noteable
  class Config
    attr_accessor :enabled
 
    def initialize
      @enabled = true
    end
  end
  
  module Controller
    
  end
  
  module Model
    def self.included(base)
      base.send :extend, ClassMethods
    end
    
    module ClassMethods
      def is_noteable(options = {})
        send :include, InstanceMethods
       
        has_many :notes,
          :class_name => 'Noteable::Note',
          :as => :item,
          :order => "created_at DESC"
      end
    end
    
    module InstanceMethods

    end
  end
end

ActiveSupport.on_load(:active_record) do
  include Noteable::Model
end

ActiveSupport.on_load(:action_controller) do
  include Noteable::Controller
end