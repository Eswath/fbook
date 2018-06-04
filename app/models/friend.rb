class Friend < ApplicationRecord
	# belongs_to :sender,class_name: "User", foreign_key: "acceptor_id" 
	# belongs_to :acceptor,class_name: "User", foreign_key: "sender_id" 
	belongs_to :sender,class_name: "User", foreign_key: "sender_id" 
	belongs_to :acceptor,class_name: "User", foreign_key: "acceptor_id"
end
