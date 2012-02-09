Factory.define(:city) do |f|
  f.name "Dallas"
end

Factory.define(:hotel) do |f|
  f.sequence(:name) { |i| "Hotel #{i}" }
  f.address "123 Main St.\nBeverly Hill, CA 90210"
  f.description{|h| "#{h.name} is the Best hotel in CA"}
  f.rate 100.0
  f.association(:city)
end