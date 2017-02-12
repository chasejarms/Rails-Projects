=begin
Associate Houses with People such that Houses can have many
Residents and each Person belongs to a House.
This relies on you specifying the correct primary_key,
foreign_key, and class_name; otherwise, when you
call House.residents rails will assume you are following
conventions and look for a residents table rather
than a people table!
=end


class Person < ActiveRecord::Base
  validates :name, presence: true
  validates :house_id, presence: true

  belongs_to :house, {
    :primary_key => :id,
    :foreign_key => :house_id,
    :class_name => "House"
  }
end
