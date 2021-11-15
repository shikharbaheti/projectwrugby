# frozen_string_literal: true

class Admin < ApplicationRecord
  devise :omniauthable, omniauth_providers: [:google_oauth2]

  def self.from_google(email:, full_name:, uid:, avatar_url:)
<<<<<<< HEAD
    return nil unless email =~ /ninarao09@tamu.edu\z/
=======
    return nil unless email =~ /shikhar@tamu.edu\z/
>>>>>>> c037be34ba6fe8ba0e7eb6edd5684b28a3fc8203

    create_with(uid: uid, full_name: full_name, avatar_url: avatar_url).find_or_create_by!(email: email)
  end
end
