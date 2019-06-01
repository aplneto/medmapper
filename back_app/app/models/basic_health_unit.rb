class BasicHealthUnit < HealthUnit

    validates :type, inclusion: { in: ['BasicHealthUnit'] }

end
