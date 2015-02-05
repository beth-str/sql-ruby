require 'pry'

# Empower my program with SQLite.

require 'sqlite3'

# Load / create our database for this program.
# Local variables can be overwritten accidentally, so better to use a constant (ALL CAPS)
# This constant will be mapped to cadejo.db
# You would use this even if the db already existed, b/c you run this to access the db
DATABASE = SQLite3::Database.new("cadejo.db")

# change setting to make it a hash so we can call key :name (better readability)
# default is arrays
DATABASE.results_as_hash = true




# We can take this and run methods on it now, b/c it is an object...
# We don't need the ";" like we do in the command line b/c SQLite adds it for us...
# Must have the " " though b/c Ruby needs it to pass it as a string...

# New Table:
# DATABASE.execute("CREATE TABLE students (id INTEGER, name TEXT)")

#Delete the table "students"
# DATABASE.execute("DROP TABLE students")

# Re-create the table "students"; set the id as teh PRIMARY KEY (not null, unique, automatic increments)
# DATABASE.execute("CREATE TABLE students (id INTEGER PRIMARY KEY, name TEXT)")

# DATABASE.execute("CREATE TABLE question (id INTEGER PRIMARY KEY, student_id INTEGER, question TEXT)")

require_relative 'student.rb'
require_relative 'question.rb'
binding.pry






# require "sqlite3"
#
# # Open a database
# db = SQLite3::Database.new "test.db"
#
# # Create a database
# rows = db.execute <<-SQL
#   create table numbers (
#     name varchar(30),
#     val int
#   );
# SQL
#
# # Execute a few inserts
# {
#   "one" => 1,
#   "two" => 2,
# }.each do |pair|
#   db.execute "insert into numbers values ( ?, ? )", pair
# end
#
# # Execute inserts with parameter markers
# db.execute("INSERT INTO students (name, email, grade, blog)
#             VALUES (?, ?, ?, ?)", [@name, @email, @grade, @blog])
#
# # Find a few rows
# db.execute( "select * from numbers" ) do |row|
#   p row
# end

