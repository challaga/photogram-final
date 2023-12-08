# == Schema Information
#
# Table name: users
#
#  id                             :integer          not null, primary key
#  email                          :string           default(""), not null
#  encrypted_password             :string           default(""), not null
#  own_photos_count               :integer
#  received_follow_requests_count :integer
#  remember_created_at            :datetime
#  reset_password_sent_at         :datetime
#  reset_password_token           :string
#  sent_follow_requests_count     :integer
#  username                       :string
#  created_at                     :datetime         not null
#  updated_at                     :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many  :likes, class_name: "Like", foreign_key: "user_id", dependent: :destroy
         has_many  :comments, class_name: "Comment", foreign_key: "commenter_id", dependent: :destroy
         has_many  :sent_follow_requests, class_name: "FollowRequest", foreign_key: "sender_id", dependent: :destroy
         has_many  :received_follow_requests, class_name: "FollowRequest", foreign_key: "recipient_id", dependent: :destroy
         has_many  :own_photos, class_name: "Photo", foreign_key: "owner_id", dependent: :destroy
end
