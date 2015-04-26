class Character < ActiveRecord::Base
  before_save do |character|
    @connection = ActiveRecord::Base.connection_pool.checkout
  end

  after_save do |character|
    ActiveRecord::Base.connection_pool.checkin(@connection)
  end
end