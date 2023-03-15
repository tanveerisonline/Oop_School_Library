# require_relative 'list_people'

class ListRental
  def list_rental(rentals)
    @rentals = rentals
    puts 'List of rentals:'
    @rentals.each_with_index do |rental, index|
      puts "#{index + 1}) Book: #{rental.book.title}, Person: #{rental.person.name}, Date: #{rental.date}"
    end
  end
end


# class ListRental
#   def list_rental
#     list_people
#     print 'ID of person: '
#     id = gets.chomp.strip.to_i
#     person_selected = @people.select { |person| person.id == id }[0]
#     person_selected.rentals.each do |rental|
#       puts "Date: #{rental.date}, Book \"#{rental.book.title}\", by #{rental.book.author}"
#     end
#   end
# end
