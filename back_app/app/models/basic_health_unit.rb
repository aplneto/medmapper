class BasicHealthUnit < HealthUnit

    def self.by_name(name)
        where('name LIKE :n', n: name)
    end

end
