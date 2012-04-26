module Noteable
  class Note < ActiveRecord::Base
    belongs_to :item, :polymorphic => true
    validates_presence_of :item
    attr_accessible :item_id, :item_type, :author, :body
  end
end
