class EmergencyUnit < HealthUnit

    validates :type, inclusion: { in: ['EmergencyUnit'] }

end
