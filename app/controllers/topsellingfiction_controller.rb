class TopsellingfictionController < ApplicationController
  def index
    response = HTTP.get("https://api.nytimes.com/svc/books/v3/lists/current/hardcover-fiction.json?api-key=#{ENV['NYT_API_KEY']}")
    books = response.parse(:json)["results"]["books"]
    books.map! {|book| {rank: book["rank"], title: book["title"], author: book["author"]}}
    render json: books
  end
end
