class Project < ApplicationRecord
  belongs_to :lead, class_name: "Account"
end
