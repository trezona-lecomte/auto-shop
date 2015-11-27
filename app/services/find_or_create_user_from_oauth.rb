class FindOrCreateUserFromOauth
  extend Forwardable
  attr_reader :user, :errors, :auth_hash

  def_delegators :user, :errors

  def initialize(auth_hash)
    @auth_hash = auth_hash
  end

  def call
    @user = User.find_or_create_by(
      uid: auth_hash["uid"],
      provider: auth_hash["provider"]
    )
    update_user_attributes
    user.save
  end

  private

  def update_user_attributes
    info = auth_hash["info"]

    user.update_attributes(
      name: info["name"],
      email: info["email"],
      location: info["location"],
      image_url: info["image"],
      url: info["urls"]["Twitter"],
      token: auth_hash["credentials"]["token"],
      preferred_language: auth_hash["extra"]["raw_info"]["lang"]
    )
  end
end
