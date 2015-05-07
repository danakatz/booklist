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

  create_table "articles", force: :cascade do |t|
    t.string  "title"
    t.integer "author_id"
    t.integer "publication_id"
    t.integer "section_id"
    t.string  "url"
    t.date    "publish_date"
  end

  add_index "articles", ["author_id"], name: "index_articles_on_author_id"
  add_index "articles", ["publication_id"], name: "index_articles_on_publication_id"
  add_index "articles", ["section_id"], name: "index_articles_on_section_id"

  create_table "authors", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
  end

  create_table "comments", force: :cascade do |t|
    t.integer "user_id"
    t.integer "article_id"
    t.string  "text"
  end

  add_index "comments", ["article_id"], name: "index_comments_on_article_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "favorites", force: :cascade do |t|
    t.integer "user_id"
    t.integer "article_id"
  end

  add_index "favorites", ["article_id"], name: "index_favorites_on_article_id"
  add_index "favorites", ["user_id"], name: "index_favorites_on_user_id"

  create_table "interests", force: :cascade do |t|
    t.integer "user_id"
    t.integer "topic_id"
  end

  add_index "interests", ["topic_id"], name: "index_interests_on_topic_id"
  add_index "interests", ["user_id"], name: "index_interests_on_user_id"

  create_table "publications", force: :cascade do |t|
    t.string "name"
    t.string "url"
  end

  create_table "sections", force: :cascade do |t|
    t.string  "name"
    t.integer "publication_id"
  end

  add_index "sections", ["publication_id"], name: "index_sections_on_publication_id"

  create_table "subjects", force: :cascade do |t|
    t.integer "topic_id"
    t.integer "article_id"
  end

  add_index "subjects", ["article_id"], name: "index_subjects_on_article_id"
  add_index "subjects", ["topic_id"], name: "index_subjects_on_topic_id"

  create_table "topics", force: :cascade do |t|
    t.string "name"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
  end

end
