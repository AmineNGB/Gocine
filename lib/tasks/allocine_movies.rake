namespace :allocine_movies do
  task update_program: :environment do
    Cinema.all.each { |cinema| AllocineMoviesService.new(cinema.allocine_id, cinema.id).call }
  end
end
