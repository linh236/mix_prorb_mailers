class Post < ApplicationRecord
  enum status: {
    "draft": "draft",
    "post": "post",
  }
end
