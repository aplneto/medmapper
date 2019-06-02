class MentalHealthUnit < HealthUnit

    validates :type, inclusion: { in: ['MentalHealthUnit'] }
  
end
