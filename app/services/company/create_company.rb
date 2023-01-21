class Company::Create
  attr_accessor :description, :email, :password

  include Callable

  def initialize(description, email, password)
    @description = description
    @email       = email
    @password    = password
  end

  def call
    build
    persist if valid?
  end

  private

  def build
    @company = Company.new(description: @description, email: @email, password: @password)
  end

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

  def persist
    @company.save
  end
end