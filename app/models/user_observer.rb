class UserObserver < ActiveRecord::Observer
  observe :user

  def after_create(user)
    Rails.logger.info "#{user.username} user is created"
  end

  def after_save(user)
    Rails.logger.info "#{user.username} user is save"
  end

  def after_destroy(user)
    Rails.logger.info "#{user.username} user is created"
  end
end
