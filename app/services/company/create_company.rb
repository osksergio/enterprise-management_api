class CreateCompany
  attr_accessor :description, :email, :password

  include Callable

  def initialize(description, email, password)
    @description = description
    @email       = email
    @password    = password
  end

  def call
    create if valid?
  end

  private

  def valid?
    existing_email = Company.find_by email: @email
    if existing_email.present?
      errors.add(:email, "has already been taken")
      return false
      raise StandardError, 'Company already exists'
    else
      return true
    end
  end

  def create
    Company.create(description: @description, email: @email, password: @password)
  end
end