class Character < ActiveRecord::Base
  before_save do |character|
    @connection = ActiveRecord::Base.connection_pool.checkout
  end

  after_save do |character|
    ActiveRecord::Base.connection_pool.checkin(@connection)
  end

  def password
    @password ||= BCrypt::Password.new(read_attribute(:password))
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    write_attribute(:password, @password)
  end

  def password_is(password)
    self.password == password
  end
end