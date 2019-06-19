module ApplicationHelper
  def account_is_administrator?
    account_signed_in? and current_account.role == 'Admin'
  end
end
