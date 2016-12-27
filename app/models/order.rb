#require 'digest/sha1'
class Order < ApplicationRecord
	belongs_to :orderable, polymorphic: true
	belongs_to :user
		# def self.createHash(amount,currency_code)
		# # 	store_id = '3344000171'
		# # 	dt = Time.now.strftime("%Y:%m:%d-%H:%M:%S")
		# # 	ss = 'TopSecret'
		# # return Digest::SHA1.hexdigest("#{store_id}#{dt}#{amount}#{currency_code}#{ss}")
		# @storeId = "3344000171"
		# @sharedSecret = "sharedsecret"
		# @stringToHash = @storeId + getDateTime + amount + currency_code + @sharedSecret
		# @hash = @stringToHash.unpack('H*').first
		# @lasthast = Digest::SHA1.hexdigest @hash
		# return @lasthast
	# end
end

		