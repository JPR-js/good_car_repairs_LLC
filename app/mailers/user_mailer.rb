class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.account_confirmation.subject
  def account_confirmation(user)
    @user = user

    mail to: user.email, subject: "Good Car Repairs LLC - Activate Email"
  end

  def reservation_confirmation(user, reservation)
    @user = user
    @reservation = reservation

    mail to: user.email, subject: "Good Car Repairs LLC - Repair Reservation Confirmation"
  end

  def car_repair_appointment(user, reservation)
    @user = user
    @reservation = reservation



    mail to: "repairs@goodcarrepairs.llc", subject: "A Car Repair Appointment has been Scheduled."

    #uncomment the line below and comment the one above if u hate having fun
    # mail to: "repairs@example.com", subject: "A Car Repair Appointment has been Scheduled."
  end



end
