class OdontologyUnit < HealthUnit

    validates :type, inclusion: { in: ['OdontologyUnit'] }
  
end
