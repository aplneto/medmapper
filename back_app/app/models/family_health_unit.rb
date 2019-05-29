class FamilyHealthUnit < BasicHealthUnit
  
  validates :type, presence: true, inclusion: { in: ['FamilyHealthUnit'] }

end
