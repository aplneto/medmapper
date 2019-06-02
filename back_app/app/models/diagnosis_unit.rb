class DiagnosisUnit < HealthUnit

    validates :type, inclusion: { in: ['DiagnosisUnit'] }

end
