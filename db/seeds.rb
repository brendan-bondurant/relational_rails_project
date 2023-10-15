# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

  @fender = InstrumentBuilder.create!(name: "Fender", year_founded: 1946, in_business: true)
  @gibson = InstrumentBuilder.create!(name: "Gibson", year_founded: 1902, in_business: true)
  @martin = InstrumentBuilder.create!(name: "Martin", year_founded: 1833, in_business: true)
  @prs = InstrumentBuilder.create!(name: "Paul Reed Smith", year_founded: 1985, in_business: true)
  @player_tele = @fender.models.create!(name: "Player Telecaster", year: 2023, vintage: false, value: 849.99)
  @vintage_tele = @fender.models.create!(name: "Vintage Telecaster", year: 1952, vintage: true, value: 55000.00)
  @ooo15m = @martin.models.create!(name: "000-15M", year: 2023, vintage: false, value: 1699.00)
  @hateful8 = @martin.models.create!(name: "Hateful 8", year: 1870, vintage: true, value: 40000.00)
  @es339 = @gibson.models.create!(name: "ES-339", year: 2023, vintage: false, value: 2999.00)
  @vintage_lp = @gibson.models.create!(name: "Les Paul", year: 1959, vintage: true, value: 375000.00)
  @dgt = @prs.models.create!(name: "DGT", year: 2023, vintage: false, value: 4600.00)