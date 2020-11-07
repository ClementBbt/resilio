# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# require "open-uri"

puts "Cleaning database..."
User.destroy_all
Bank.destroy_all
BankAccount.destroy_all
Transaction.destroy_all
Subscription.destroy_all


puts "Creating users..."

# file = URI.open('https://avatars3.githubusercontent.com/u/46726561?s=60&u=0220bde2b8e3e990aabc64041748d16b4e3c5777&v=4')
caroline = User.new(
civility: "Madame",
first_name: "Caroline",
last_name: "Karpiel",
email: "caroline@test.com",
password: "test321",
address: "41 rue popincourt",
zip_code: 75011,
city: "Paris",
phone_number: "0643573525"
)

# caroline.photo.attach(io: file, filename: 'caroline.png', content_type: 'image/png')
caroline.save!

# file = URI.open('https://avatars0.githubusercontent.com/u/65772685?s=460&u=19842663fa4b75c28caf632b120957e3dfdb2f97&v=4')
camille = User.new(
civility: "Madame",
first_name: "Camille",
last_name: "Subtil",
email: "camille@test.com",
password: "test321",
address: "2 villa Gaudelet",
zip_code: 75011,
city: "Paris",
phone_number: "0716463951"
)
# camille.photo.attach(io: file, filename: 'camille.png', content_type: 'image/png')
camille.save!

# file = URI.open('https://avatars3.githubusercontent.com/u/63556423?s=460&u=fd79c26bca3aead73759c01c5f950bedb9e9b3a8&v=4')
clement = User.new(
civility: "Monsieur",
first_name: "Clement",
last_name: "Bibolet",
email: "clement@test.com",
password: "test321",
address: "36 rue chaptal",
zip_code: 92300,
city: "Levallois-Perret",
phone_number: "0685982011"
)
# clement.photo.attach(io: file, filename: 'clement.png', content_type: 'image/png')
clement.save!

puts "Finished users!"

puts "Creating banks..."

bnp = Bank.new(
name: "BNP",
user: clement
)
bnp.save!

hello_bank = Bank.new(
name: "HelloBank!",
user: caroline
)
hello_bank.save!

sg = Bank.new(
name: "Société Générale",
user: camille
)
sg.save!

puts "Finished banks!"

puts "Creating bank accounts..."

compte_caroline = BankAccount.new(
name: "Compte de chèques",
bank: hello_bank
)
compte_caroline.save!

compte_camille = BankAccount.new(
name: "Compte de chèques",
bank: sg
)
compte_camille.save!

compte_clement = BankAccount.new(
name: "Compte de chèques",
bank: bnp
)
compte_clement.save!

puts "Finished banks!"

puts "Creating subscriptions..."

netflix = Subscription.new(
name: "Netflix",
start_date: "2018-10-15",
price: 11.99,
category: "Multimedia",
periodicity: "mensuel",
commitment: false,
status: "en cours",
user: clement
)
netflix.save!

edf = Subscription.new(
name: "EDF",
start_date: "2015-02-23",
price: 35.56,
category: "Energie",
periodicity: "mensuel",
commitment: false,
status: "en cours",
user: clement
)
edf.save!

amex = Subscription.new(
name: "American Express",
start_date: "2020-02-02",
end_date: "2021-02-02",
price: 150,
category: "Services financiers",
periodicity: "annuel",
commitment: true,
notice: 30,
status: "en cours",
user: clement
)
amex.save!

puts "Finished subscriptions!"

puts "Creating transactions..."

# Deliveroo Plus

deliveroo_one = Transaction.new(
title: "Deliveroo Plus FR London",
reference: "3ff56785g3",
date: "2020-10-07",
amount: 10.99,
bank_account: compte_clement
)
deliveroo_one.save!

deliveroo_two = Transaction.new(
title: "Deliveroo Plus FR London",
reference: "3ff56785g3",
date: "2020-09-07",
amount: 10.99,
bank_account: compte_clement
)
deliveroo_two.save!

deliveroo_three = Transaction.new(
title: "Deliveroo Plus FR London",
reference: "3ff56785g3",
date: "2020-08-07",
amount: 10.99,
bank_account: compte_clement
)
deliveroo_three.save!

# Club Med Gym

cmg_one = Transaction.new(
title: "Prlv De CMG Bercy",
reference: "4y576653k5",
date: "2020-10-03",
amount: 69,
bank_account: compte_clement
)
cmg_one.save!

cmg_two = Transaction.new(
title: "Prlv De CMG Bercy",
reference: "4y576653k5",
date: "2020-09-03",
amount: 69,
bank_account: compte_clement
)
cmg_two.save!

# Auchan

auchan_one = Transaction.new(
title: "CB Auchan Bagnolet",
reference: "37kk6895f7",
date: "2020-09-16",
amount: 38.21,
bank_account: compte_clement
)
auchan_one.save!

auchan_two = Transaction.new(
title: "CB Auchan Bagnolet",
reference: "37kk6895f7",
date: "2020-09-25",
amount: 122.28,
bank_account: compte_clement
)
auchan_two.save!

auchan_three = Transaction.new(
title: "CB Auchan Bagnolet",
reference: "37kk6895f7",
date: "2020-10-03",
amount: 61.20,
bank_account: compte_clement
)
auchan_three.save!

# Transactions autres

digitick = Transaction.new(
title: "CB Digitick Billet",
reference: "457tds3209",
date: "2020-10-20",
amount: 39,
bank_account: compte_clement
)
digitick.save!

pitaya = Transaction.new(
title: "CB Pitaya Obkf",
reference: "4577gf2209",
date: "2020-09-10",
amount: 10.50,
bank_account: compte_clement
)
pitaya.save!

puts "Finished!"
