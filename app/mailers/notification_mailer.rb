class NotificationMailer < ActionMailer::Base
  default from: "hogehoge@example.com"

  def send_confirm_to_user(user)
    @user = user
    mail(
      subject: "イベントへの申し込みが完了いたしました。担当よりご連絡差し上げます。", #メールのタイトル
      to: @user.email #宛先
    ) do |format|
      format.text
    end
  end
end