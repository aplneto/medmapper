class FamilyHealthUnit < HealthUnit

    validates :type, inclusion: { in: ['FamilyHealthUnit'] }

end
