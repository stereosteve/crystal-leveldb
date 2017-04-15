require "./src/leveldb"

# Create DB (if does not exist yet) and open
db = LevelDB::DB.new("/tmp/crystal-leveldb-bug.db")
db = LevelDB::DB.new("/tmp/crystal-leveldb-bug.db")

# Put, get, delete
db.put("name", "Sergey")
db.get("name") # => "Sergey"
db.delete("name")
db.get("name") # => nil

# [], []= methods work the same
db["city"] = "Berlin"
db["city"] # => "Berlin"

# Iterate through all the keys
db.each do |key, val|
  puts "#{key} = #{val}"
end

# Close database
db.close
db.closed? # => true
db.opened? # => false

# Close the database and remove all the data
db.destroy

# Remove all the keys, keep the database open
db.clear
