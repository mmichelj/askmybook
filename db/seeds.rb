# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

def load_book_embeddings()
    sql = "\copy books(context, embedding, token_count) FROM '#{Rails.root.join('public','pdf_embeddings.csv')}' with (format csv, header true)"
    ActiveRecord::Base.connection.execute(sql)
end

def load_question_answers_embeddings()
    sql = "\copy question_answers(question, question_embedding, token_count, known, answer) FROM '#{Rails.root.join('public','known_question_answers.csv')}' with (format csv, header true)"
    ActiveRecord::Base.connection.execute(sql)
end

load_question_answers_embeddings()
load_book_embeddings()