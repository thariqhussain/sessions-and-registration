class UserMailer < ApplicationMailer
    default from: 'thariqhussain5@gmail.com'

    def welcome_mail
        @user = params[:user]
        @url = "http://localhost:3000/"
        mail(to: @user.email , subject: 'welcome to application')
    end
end
