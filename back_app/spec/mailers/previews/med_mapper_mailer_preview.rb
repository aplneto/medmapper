# Preview all emails at http://localhost:3000/rails/mailers/med_mapper_mailer
class MedMapperMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/med_mapper_mailer/welcome
  def welcome
    MedMapperMailer.welcome
  end

  # Preview this email at http://localhost:3000/rails/mailers/med_mapper_mailer/contact_us
  def contact_us
    MedMapperMailer.contact_us
  end

  # Preview this email at http://localhost:3000/rails/mailers/med_mapper_mailer/violation
  def violation
    MedMapperMailer.violation
  end

end
