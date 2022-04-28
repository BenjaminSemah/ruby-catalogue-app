require_relative '../app/book'
require_relative '../app/item'

describe Book do
  before :each do
    @book = Book.new('marriage', Time.new(2021, 0o5, 16), 'longhorn', 'bad')
  end

  context 'When testing the Book class' do
    it 'should have an object with the instance of Book' do
      book_class = @book.class

      expect(book_class).to be Book
    end

    it 'tests to see if it returns the book instance' do
      expect(@book).to be_instance_of(Book)
    end

    it 'inherits from Item class' do
      expect(@book).to be_kind_of(Item)
    end
  end
end
