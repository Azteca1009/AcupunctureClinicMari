module SessionsHelper
  # 渡されたユーザーでログインする
  def log_in(user)
    # puts "log_in(user)入ったよ"
    session[:user_id] = user.id
  end

  # 現在ログイン中のユーザーを返す (いる場合)
  def current_user
    # puts "current_user入ったよ"# + session[:user_id]
    if session[:user_id]
    #@current_user = @current_user || User.find_by(id: session[:user_id])と同じ意味
     @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  #受け取ったユーザーがログイン中のユーザーと一致すればtrueを返す
  def current_user?(user)
    # puts "current_user?入ったよ" + user
    user == current_user
  end

  # ユーザーがログインしていればtrue、その他ならfalseを返す
  def logged_in?
    # puts "logged_in?入ったよ"
    return !current_user.nil?
  end

  # 現在のユーザーをログアウトする
  def log_out
    # puts "log_out入ったよ"
    session.delete(:user_id)
    @current_user = nil
  end
end
