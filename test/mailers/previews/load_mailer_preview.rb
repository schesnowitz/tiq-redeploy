# Preview all emails at http://localhost:3000/rails/mailers/load_mailer
class LoadMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/load_mailer/active_load
  def active_load 
    load = Load.last
    LoadMailer.active_load(load)  
  end

end 
