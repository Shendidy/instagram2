require 'rails_helper'

# RSpec.describe PostsController, type: :controller do
#
#   describe "GET /" do
#     it "responds with 200" do
#       user = User.create(user_name: 'testUser', email: 'test@test.com', password: "password", password_confirmation: "password")
#       sign_in user
#
#       get :index
#       expect(response).to have_http_status(200)
#
#       sign_out user
#     end
#   end
#
#   describe "GET /new " do
#     it "responds with 302 if not signed in" do
#       get :new
#       expect(response).to have_http_status(302)
#     end
#   end
#
#   describe "GET /new " do
#     it "responds with 200 if signed in" do
#       user = User.create(user_name: 'testUser', email: 'test@test.com', password: "password", password_confirmation: "password")
#       sign_in user
#
#       get :new
#       expect(response).to have_http_status(200)
#
#       sign_out user
#     end
#   end
#
#   describe "POST /" do
#     it "responds with 200" do
#       user = User.create(user_name: 'testUser', email: 'test@test.com', password: "password", password_confirmation: "password")
#       sign_in user
#
#       post :create, params: { post: { message: "Hello, world!" } }
#       expect(response).to redirect_to(posts_url)
#
#       sign_out user
#     end
#
#     it "creates a post" do
#       user = User.create(user_name: 'testUser', email: 'test@test.com', password: "password", password_confirmation: "password")
#       sign_in user
#
#       post :create, params: { post: { message: "Hello, world!" } }
#       expect(Post.find_by(message: "Hello, world!")).to be
#
#       sign_out user
#     end
#   end
# end
