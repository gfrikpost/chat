class UserForm

  attr_reader :user, :args, :error

  def initialize(user, args)
    @user = user
    @args = args
    @previous_name = user.name
  end

  def submit
    return unless validate_name
    args.each do |key, value|
      user.public_send("#{key}=", value)
    end
    if user.save
      update_user_name_on_front_if_changed
      true
    else
      @error = 'Password and confirmation do not match.'
      nil
    end
  end

  private

  attr_reader :previous_name

  def update_user_name_on_front_if_changed
    return if previous_name.nil?
    return if previous_name == user.name
    ChatDeliverer.update_user_name(user)
  end

  def validate_name
    return true if args[:name].present?
    @error = 'Name can\'t be blank'
    nil
  end

end
