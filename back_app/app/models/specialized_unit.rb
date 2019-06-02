class SpecializedUnit < HealthUnit

    validates :type, inclusion: { in: ['SpecializedUnit'] }
  
end
