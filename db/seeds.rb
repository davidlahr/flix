# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# user = User.where(email: "davidlahr@yahoo.com").first_or_initialize


# User.create!(
#     email: "larry@example.com",
#     name: "Larry",
#     password: "password",
#     admin: true
#     )
#     
#
[
#   ["Avengers: Endgame", "avengers-end-game.png"],
#   ["Captain Marvel", "captain-marvel.png"],
#   ["Black Panther", "black-panther.png"],
#   ["Avengers: Infinity War", "avengers-infinity-war.png"],
#   ["Green Lantern", "green-lantern.png"],
  ["Fantastic Four", "fantastic-four.png"],
#   ["Iron Man", "ironman.png"],
#   ["Superman", "superman.png"],
  ["Spider-Man", "spiderman.png"],
  ["Batman", "batman.png"],
  ["Catwoman", "catwoman.png"],
  ["Wonder Woman", "wonder-woman.png"]
].each do |movie_title, file_name|
    movie = Movie.find_by!(name: movie_title)
    file = File.open(Rails.root.join("app/assets/images/#{file_name}"))
    movie.main_image.attach(io: file, filename: file_name)

end

# Movie.create!([
#   {
#     name: 'Avengers: Endgame',
#     description:
#     %{
#       After the devastating events of Avengers: Infinity War, the universe
#       is in ruins. With the help of remaining allies, the Avengers assemble
#       once more in order to undo Thanos' actions and restore order to the universe.
#     }.squish,
#     release_date: "2019-04-26",
#     rating: 'PG-13',
#     total_gross: 1_223_641_414
#   },
#   {
#     name: 'Captain Marvel',
#     description:
#     %{
#       Carol Danvers becomes one of the universe's most powerful heroes when Earth is caught in the middle of a galactic war between two alien races.
#     }.squish,
#     release_date: "2019-03-08",
#     rating: 'PG-13',
#     total_gross: 1_110_662_849
#   },
#   {
#     name: 'Black Panther',
#     description:
#     %{
#       T'Challa, heir to the hidden but advanced kingdom of Wakanda, must step forward to lead his people into a new future and must confront a challenger from his country's past.
#     }.squish,
#     release_date: "2018-02-16",
#     rating: 'PG-13',
#     total_gross: 1_346_913_161
#   },
#   {
#     name: 'Avengers: Infinity War',
#     description:
#     %{
#       The Avengers and their allies must be willing to sacrifice all in an attempt to defeat the powerful Thanos before his blitz of devastation and ruin puts an end to the universe.
#     }.squish,
#     release_date: "2018-04-27",
#     rating: 'PG-13',
#     total_gross: 2_048_359_754
#   },
#   {
#     name: 'Green Lantern',
#     description:
#     %{
#       Reckless test pilot Hal Jordan is granted an alien ring that bestows him with otherworldly powers that inducts him into an intergalactic police force, the Green Lantern Corps.
#     }.squish,
#     release_date: "2011-06-17",
#     rating: 'PG-13',
#     total_gross: 219_851_172
#   },
#   {
#     name: 'Fantastic Four',
#     description:
#     %{
#       Four young outsiders teleport to an alternate and dangerous universe which alters their physical form in shocking ways. The four must learn to harness their new abilities and work together to save Earth from a former friend turned enemy.
#     }.squish,
#     release_date: "2015-08-07",
#     rating: 'PG-13',
#     total_gross: 168_257_860
#   },
#   {
#     name: 'Iron Man',
#     description:
#     %{
#       When wealthy industrialist Tony Stark is forced to build an
#       armored suit after a life-threatening incident, he ultimately
#       decides to use its technology to fight against evil.
#     }.squish,
#     release_date: "2008-05-02",
#     rating: 'PG-13',
#     total_gross: 585_366_247
#   },
#   {
#     name: 'Superman',
#     description:
#     %{
#       An alien orphan is sent from his dying planet to Earth, where
#       he grows up to become his adoptive home's first and greatest
#       super-hero.
#     }.squish,
#     release_date: "1978-12-15",
#     rating: 'PG',
#     total_gross: 300_451_603
#   },
#   {
#     name: 'Spider-Man',
#     description:
#     %{
#       When bitten by a genetically modified spider, a nerdy, shy, and
#       awkward high school student gains spider-like abilities that he
#       eventually must use to fight evil as a superhero after tragedy
#       befalls his family.
#     }.squish,
#     release_date: "2002-05-03",
#     rating: 'PG-13',
#     total_gross: 825_025_036
#   },
#   {
#     name: 'Batman',
#     description:
#     %{
#       The Dark Knight of Gotham City begins his war on crime with his
#       first major enemy being the clownishly homicidal Joker.
#     }.squish,
#     release_date: "1989-06-23",
#     rating: 'PG-13',
#     total_gross: 411_348_924
#   },
#   {
#     name: "Catwoman",
#     description:
#     %{
#       Patience Philips seems destined to spend her life apologizing for taking up space. Despite her artistic ability she has a more than respectable career as a graphic designer.
#     }.squish,
#     release_date: "2004-07-23",
#     rating: "PG-13",
#     total_gross: 82_102_379
#   },
#   {
#     name: "Wonder Woman",
#     description:
#     %{
#       When a pilot crashes and tells of conflict in the outside world, Diana, an Amazonian warrior in training, leaves home to fight a war, discovering her full powers and true destiny.
#     }.squish,
#     release_date: "2017-06-02",
#     rating: "PG-13",
#     total_gross: 821_847_012
#   },
#   {
#     name: "Point Break",
#     description:
#     %{
#       After a string of bizarre bank robberies in Southern California, with the crooks donning masks of various former presidents, a federal agent, Johnny Utah (Keanu Reeves), infiltrates the suspected gang. But this is no ordinary group of robbers. They're surfers.
#     }.squish,
#     release_date: "1991-06-12",
#     rating: "R",
#     total_gross: 250_847_012
#   }
# ])
