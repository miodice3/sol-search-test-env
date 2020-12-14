class User < ApplicationRecord

    has_many :owner_contracts, foreign_key: :owner_id, class_name: 'Contract'
    has_many :consumer_contracts, foreign_key: :consumer_id, class_name: 'Contract'

    has_many :owned_assets, foreign_key: :owner_id, class_name: 'Asset'
end

=begin
#u.owner_contracts
#c.consumer_id=u2.id
#c.owner
2.6.1 :017 > u.consumer_contracts
  Contract Load (0.2ms)  SELECT "contracts".* FROM "contracts" WHERE "contracts"."consumer_id" = ? LIMIT ?  [["consumer_id", 1], ["LIMIT", 11]]
 => #<ActiveRecord::Associations::CollectionProxy []> 

 2.6.1 :018 > u.owner_contracts
 Contract Load (0.1ms)  SELECT "contracts".* FROM "contracts" WHERE "contracts"."owner_id" = ? LIMIT ?  [["owner_id", 1], ["LIMIT", 11]]
=> #<ActiveRecord::Associations::CollectionProxy [#<Contract id: 1, owner_id: 1, consumer_id: 4, asset_id: nil, status: nil, created_at: "2020-12-14 17:14:19", updated_at: "2020-12-14 18:20:46">]> 

2.6.1 :019 > u2.owner_contracts
  Contract Load (0.1ms)  SELECT "contracts".* FROM "contracts" WHERE "contracts"."owner_id" = ? LIMIT ?  [["owner_id", 4], ["LIMIT", 11]]
 => #<ActiveRecord::Associations::CollectionProxy []> 

2.6.1 :020 > u2.consumer_contracts
  Contract Load (0.1ms)  SELECT "contracts".* FROM "contracts" WHERE "contracts"."consumer_id" = ? LIMIT ?  [["consumer_id", 4], ["LIMIT", 11]]
 => #<ActiveRecord::Associations::CollectionProxy [#<Contract id: 1, owner_id: 1, consumer_id: 4, asset_id: nil, status: nil, created_at: "2020-12-14 17:14:19", updated_at: "2020-12-14 18:20:46">]> 
 
2.6.1 :023 > c.owner
 => #<User id: 1, name: "Mike", email: "miodice3@gmail.com", uid: "12558982", created_at: "2020-12-13 18:33:46", updated_at: "2020-12-13 18:34:12"> 
2.6.1 :024 > c.consumer
 => #<User id: 4, name: "George", email: nil, uid: nil, created_at: "2020-12-14 18:18:25", updated_at: "2020-12-14 18:18:25">

2.6.1 :008 > p=Asset.new
 => #<Asset id: nil, owner_id: nil, name: nil, created_at: nil, updated_at: nil> 

 2.6.1 :009 > p.owner_id=User.first.id
  User Load (0.2ms)  SELECT "users".* FROM "users" ORDER BY "users"."id" ASC LIMIT ?  [["LIMIT", 1]]
 => 1 
 2.6.1 :011 > p.name="Pearl Street"

 2.6.1 :018 > c.asset
 => #<Asset id: 2, owner_id: 1, name: "Pearl Street", created_at: "2020-12-14 18:39:01", updated_at: "2020-12-14 18:39:01"> 
2.6.1 :019 > c.asset.name
 => "Pearl Street" 

2.6.1 :026 > u.owned_assets
  Asset Load (0.2ms)  SELECT "assets".* FROM "assets" WHERE "assets"."owner_id" = ? LIMIT ?  [["owner_id", 1], ["LIMIT", 11]]
 => #<ActiveRecord::Associations::CollectionProxy [#<Asset id: 2, owner_id: 1, name: "Pearl Street", created_at: "2020-12-14 18:39:01", updated_at: "2020-12-14 18:39:01">]> 

 2.6.1 :030 > u.owned_assets[0].contracts
  Contract Load (0.2ms)  SELECT "contracts".* FROM "contracts" WHERE "contracts"."asset_id" = ? LIMIT ?  [["asset_id", 2], ["LIMIT", 11]]
 => #<ActiveRecord::Associations::CollectionProxy [#<Contract id: 1, owner_id: 1, consumer_id: 4, asset_id: 2, status: nil, created_at: "2020-12-14 17:14:19", updated_at: "2020-12-14 18:39:35">]> 
=end