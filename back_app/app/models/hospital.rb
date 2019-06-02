class Hospital < HealthUnit

    validates :type, inclusion: { in: ['Hospital'] }

end
