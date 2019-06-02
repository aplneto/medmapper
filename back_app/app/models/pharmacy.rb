class Pharmacy < HealthUnit

    validates :type, inclusion: { in: ['Pharmacy'] }
  
end
