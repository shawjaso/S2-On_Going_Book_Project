class Notifier < ActionMailer::Base
  default from: "ticketee@gmail.com"

  def comment_updated(comment, user)
    @comment = comment
    @user = user
    mail(:to => user.email,
         :subject => "[ticketee] #{comment.ticket.project.name} - #{comment.ticket.title}",
         :from => "Ticketee <shawjaso+#{comment.ticket.project.id}+#{comment.ticket_id}@gmail.com>")
  end
end

