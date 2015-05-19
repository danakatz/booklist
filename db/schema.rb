# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 0) do

  create_table "authors", force: :cascade do |t|
    t.string "name"
  end

  create_table "books", force: :cascade do |t|
    t.string  "title"
    t.integer "author_id"
    t.string  "isbn"
    t.string  "image_url"
    t.string  "amazon_url"
    t.boolean "reviewed",    default: false
    t.integer "rank"
    t.boolean "current",     default: false
    t.string  "description"
  end

  add_index "books", ["author_id"], name: "index_books_on_author_id"

  create_table "comments", force: :cascade do |t|
    t.integer "user_id"
    t.integer "book_id"
    t.string  "text"
    t.date    "date"
  end

  add_index "comments", ["book_id"], name: "index_comments_on_book_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "favorite_authors", force: :cascade do |t|
    t.integer "user_id"
    t.integer "author_id"
  end

  add_index "favorite_authors", ["author_id"], name: "index_favorite_authors_on_author_id"
  add_index "favorite_authors", ["user_id"], name: "index_favorite_authors_on_user_id"

  create_table "favorite_books", force: :cascade do |t|
    t.integer "user_id"
    t.integer "book_id"
  end

  add_index "favorite_books", ["book_id"], name: "index_favorite_books_on_book_id"
  add_index "favorite_books", ["user_id"], name: "index_favorite_books_on_user_id"

  create_table "reviewers", force: :cascade do |t|
    t.string "name"
  end

  create_table "reviews", force: :cascade do |t|
    t.string  "title"
    t.integer "reviewer_id"
    t.integer "book_id"
    t.string  "url"
    t.date    "publish_date"
    t.string  "blurb"
  end

  add_index "reviews", ["book_id"], name: "index_reviews_on_book_id"
  add_index "reviews", ["reviewer_id"], name: "index_reviews_on_reviewer_id"

  create_table "users", force: :cascade do |t|
    t.string "password"
    t.string "username"
    t.string "email"
  end

end
