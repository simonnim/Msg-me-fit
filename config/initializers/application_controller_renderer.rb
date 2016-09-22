# Be sure to restart your server when you modify this file.

# ApplicationController.renderer.defaults.merge!(
#   http_host: 'example.org',
#   https: false
# )
class ActionDispatch::DebugExceptions
  alias_method :old_log_error, :log_error
  def log_error(env, wrapper)
    if wrapper.exception.is_a?  ActionController::RoutingError
      return
    else
      old_log_error env, wrapper
    end
  end
end

# code that kills all development log errors we were getting for routing error