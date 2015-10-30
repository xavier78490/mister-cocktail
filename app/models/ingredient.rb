class Ingredient < ActiveRecord::Base
	has_many :doses
	has_many :cocktails, through: :doses
end
