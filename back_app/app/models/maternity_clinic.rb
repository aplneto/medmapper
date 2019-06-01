class MaternityClinic < HealthUnit

    validates :type, inclusion: { in: ['MaternityClinic'] }
  
end
