 class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  # has_many :friends, class_name: "User", foreign_key: 'friend_id'
  # belongs_to :friend, class_name:"User"

  has_many :likes, through: :posts
 
  has_many :sent_requests, foreign_key: :sender_id, class_name: 'Friend'

  has_many :acceptors, :through => :sent_requests, source: :acceptor



  has_many :ack_requests, foreign_key: :acceptor_id, class_name: 'Friend'

  has_many :senders, :through => :ack_requests, source: :sender

  
  has_many :posts, dependent: :destroy
  
  scope :friends, ->(user_id) {

        User.find(user_id).senders + User.find(user_id).acceptors
    }
  scope :pending_friends, ->(user_id) {
        
        User.find(user_id).senders.where("status='PENDING'")
    }
  scope :pending_friends_at_sender, ->(user_id) {
        
        User.find(user_id).acceptors.where("status='PENDING'")
    }
  scope :accepted_friends, ->(user_id) {
        
        User.find(user_id).acceptors.where("status='TRUE'")
    }
  scope :accepted_friends_at_sender, ->(user_id) {
        
        User.find(user_id).senders.where("status='TRUE'")
    }
  scope :find_friends, ->(user_id) {
        User.find(user_id).acceptors.where("status='PENDING'") + User.find(user_id).acceptors.where("status='TRUE'")
    } 


  # has_many :senders, class_name: 'Friend', foreign_key: 'sender_id'

  # has_many :sent_requests, class_name: 'User', through: 'sender'

  # has_many :acceptors, class_name: 'Friend', foreign_key: 'acceptor_id'

  # has_many :ack_requests, class_name: 'User', through: 'acceptor'

end
