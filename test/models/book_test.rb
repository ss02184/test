require 'test_helper'

class BookTest < ActiveSupport::TestCase

  test "empty form" do
    book = Book.new
    book.save
    refute book.valid?
  end

  test "should save valid book" do
    book = Book.new
    book.title = "My Book"
    book.description = "Description"
    book.author = "Shourya"
    book.save
    assert book.validate

  end

  test "should not save duplicate book title" do
    book1 = Book.new
    book1.title = "Title"
    book1.description = "Description"
    book1.author = "Author1"
    book1.save
    assert book1.valid?

    book2 = Book.new
    book2.title = "Title"
    book2.description = "Description2"
    book2.author = "Author2"
    book2.save
    refute book2.valid?

  end

  test "missing description field" do
    assert_not Book.new(title: "Mambo no 5", author: "Ximena").save
  end

  test "missing title" do
    assert_not Book.new(description: "Biggest Bruh Moment", author: "Bruh").save
  end

  test "missing author" do
    assert_not Book.new(title: "1984", description: "Very scary book").save
  end
end
