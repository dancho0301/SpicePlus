class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    admin_path
  end

  before_action do
    if (request.user_agent =~ /Windows/ && request.user_agent =~ /touch/) ||
      request.user_agent =~ /ipad/ ||
      (request.user_agent =~ /Android/ && request.user_agent !~ /Mobile/) ||
      (request.user_agent =~ /firefox/ && request.user_agent =~ /tablet/) ||
      request.user_agent =~ /kindle/ ||
      request.user_agent =~ /Silk/ ||
      request.user_agent =~ /playbook/
      request.variant = :tablet
    elsif (request.user_agent =~ /Windows/ && request.user_agent =~ /Phone/) ||
      request.user_agent =~ /iPhone/ ||
      request.user_agent =~ /ipod/ ||
      (request.user_agent =~ /Android/ && request.user_agent =~ /Mobile/) ||
      (request.user_agent =~ /firefox/ && request.user_agent =~ /Mobile/) ||
      request.user_agent =~ /blackberry/
      request.variant = :mobile
    end

    puts request.user_agent
    puts request.variant

  end


end
