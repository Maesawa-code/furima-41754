class PurchaseRecordDeliveryAddress
  include ActiveModel::Model
  attr_accessor :item, :user, :postal_code, :prefecture_id, :city, :address, :building_name, :phone_number, :purchase_record
end
