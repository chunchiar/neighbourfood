class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]
  before_action :configure_chef_account_update_params, only: [:chef_update]
  respond_to :js

  def create
    # super
    # binding.pry
    build_resource(sign_up_params)

    resource.save
    yield resource if block_given?

    if resource.persisted?

      if resource.active_for_authentication?
        sign_up(resource_name, resource)
        redirect_to root_path
      else
        expire_data_after_sign_in!
        redirect_to root_path
      end

    else
      clean_up_passwords resource
      set_minimum_password_length
      flash.now[:danger] = resource.errors.full_messages
    end

  end

  def edit
    super
    # binding.pry
  end

  def update
    # super
    self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)
    prev_unconfirmed_email = resource.unconfirmed_email if resource.respond_to?(:unconfirmed_email)

    resource_updated = update_resource(resource, account_update_params)
    yield resource if block_given?
    if resource_updated
      if is_flashing_format?
        flash_key = update_needs_confirmation?(resource, prev_unconfirmed_email) ?
          :update_needs_confirmation : :updated
        set_flash_message :notice, flash_key
      end
      bypass_sign_in resource, scope: resource_name
      # respond_with resource, location: after_update_path_for(resource)

      unless current_user&.chef?
        redirect_to root_path
      else
        redirect_to users_chef_path
      end

    else
      clean_up_passwords resource
      # respond_with resource
      flash.now[:danger] = resource.errors.full_messages
    end

  end

  def chef

  end

  def chef_update
    self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)
    prev_unconfirmed_email = resource.unconfirmed_email if resource.respond_to?(:unconfirmed_email)
    resource_updated = update_resource(resource, chef_account_update_params)
    yield resource if block_given?
    if resource_updated
      if is_flashing_format?
        flash_key = update_needs_confirmation?(resource, prev_unconfirmed_email) ?
          :update_needs_confirmation : :updated
        set_flash_message :notice, flash_key
      end
      bypass_sign_in resource, scope: resource_name
      # respond_with resource, location: after_update_path_for(resource)

      # update user role
      @user = current_user
      @user.update(role: 1)

      unless current_user&.chef?
        redirect_to root_path
      else
        redirect_to users_chef_path
      end

    else
      clean_up_passwords resource
      # respond_with resource
      flash.now[:danger] = resource.errors.full_messages
    end
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password])
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email, :phone, :address, :store_name, :profile_image, :password, :about, :bank, :acc_no, :acc_name])
  end

  def configure_chef_account_update_params
    devise_parameter_sanitizer.permit(:chef_account_update, keys: [:store_name, :address, :current_password, :bank, :acc_no, :acc_name])
  end

  def chef_account_update_params
    devise_parameter_sanitizer.sanitize(:chef_account_update)
  end

  # this is to remove current password for fb user
  def update_resource(resource, params)
    if current_user.provider == "facebook"
      params.delete("current_password")
      resource.update_without_password(params)
    else
      resource.update_with_password(params)
    end
  end

end
