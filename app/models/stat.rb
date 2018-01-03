require "open-uri"
class Stat < ApplicationRecord

	validates :amtDue, :amtDue, :total, presence: true
	validate :not_in_list, on: :create

	scope :addr, ->(address) {where address: address }

	before_create :set_genesis

	before_validation :set_total

	def self.import_all!
		distinct.pluck(:address).each  do |addr|
			begin
				import! addr
			rescue
				next
			end
		end
	end

	def self.import!(addr)
		url = "https://supportxmr.com/api/miner/#{addr}/stats"
		begin
			args = JSON.parse(open(url).read).slice("amtPaid", "amtDue").merge(address: addr)
			Stat.create(args)
		rescue
			p "failed"
		end
	end

	def amtPaid=(val) super; set_total; end
	def amtDue=(val) super; set_total; end

	def display_payment
		XMR.new(payment).format
	end

	def display_total
		XMR.new(total).format
	end

	def display_amtPaid
		XMR.new(amtPaid).format
	end

	def display_amtDue
		XMR.new(amtDue).format
	end

	private

	def set_total
		self.total = (amtDue + amtPaid)
		# not genesis
		if other_stats.any?
			self.payment = total - other_stats.last.total
		else
			self.payment = total
		end
	end

	def not_in_list
		self.errors.add(:total, :uniqueness) if other_stats.find_by(total: total)
	end

	def other_stats
		Stat.addr(address)
	end

	def set_genesis
		self.genesis = true unless other_stats.any?
	end
end
