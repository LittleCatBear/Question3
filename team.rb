class Team
  Member = Struct.new(:name)

  def initialize
    @members = []
  end

  def <<(name)
    @members << Member.new(name)
  end

  def members_names
    @members.map { |member| member.name }
  end

  def pro_print(limit = 10)
    members_names.take(limit).each { |name| puts name.capitalize }
  end

  def reverse_print
    members_names.reverse.each { |name| puts name.reverse.downcase }
  end

  # I assumed the purpose was to (in the end) be able to add as many options as possible,
  # and to be qble to qpply several presentation options.
  # I like this implementation because it offers more flexibility and you don't have to
  # add new cases when you want to add a new presentation option.
  # The obvious drawback is that it's a bit less readable. There is also less constraints:
  # its possible to call presentation_print("shuffle", "sort"), which doesn't make much sense.
  def presentation_print(*args)
    list = members_names
    args.each do |arg|
      list = list.send(arg.to_sym) if members_names.respond_to?(arg.to_sym)
    end
    puts "Members:"
    list.each { |name| puts "* #{name}" }
  end


=begin
  # This version is a bit more readable and also maybe more common as well.
  # But it's necessary to add manually each new option behaviour manually,
  # and if there are many of them in the end, you have a huge switch case and it doesn't look great.
  # also because the function is expecting specific options, it would be better to add the expected options as comments
  # Options expected:
  # options["shuffle"]: true|false
  # options["sort"]: true|false
  # options["reverse"]: true|false
  def presentation_print(options = {})
    list = members_names
    case options
    when options["shuffle"]
      list.shuffle!
    when options["sort"]
      list.sort!
    when options["reverse"]
      list.reverse!
    end
    puts "Members:"
    list.each { |name| puts "* #{name}" }
  end
=end
  def funny_print
    sunglasses_face="\u{1F60E}".encode('utf-8')
    books="\u{1F4DA}".encode('utf-8')
    members_names.each do |name|
      puts "#{books}  #{name} #{sunglasses_face}"
    end
  end
end
