class Polyclinic < HealthUnit

    validates :type, inclusion: { in: ['Polyclinic'] }

end
