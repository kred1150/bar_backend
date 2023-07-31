# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Bar.create({ name: "Chicago Bears Bar", price: 575.25, description: "A perfect bar to bring to a tailgate, this Chicago Bears bar folds up and can be easily transported in your car, or sotred in the garage." })

Bar.create({ name: "Land Shark Bar", price: 545.25, description: "Get a taste of island time with this LandShark themed portable bar, and enjoy a cheeseburger and beer in paradice atop this lightweight bar top." })

Bar.create({ name: "Buffalo Bills Bar", price: 575.25, description: "A perfect bar to bring to a tailgate, this Buffalo Bills bar folds up and can be easily transported in your car, or sotred in the garage." })

Image.create({ bar_id: 1, url: "https://www.sportslogos.net/logos/view/16923591999/Chicago_Bears/1999/Alternate_Logo" })
Image.create({ bar_id: 2, url: "https://logodix.com/logos/1926007" })
Image.create({ bar_id: 3, url: "https://www.sportslogos.net/logos/view/14972061974/Buffalo_Bills/1974/Alternate_Logo" })
