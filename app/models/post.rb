class Post < ApplicationRecord
  belongs_to :user

  # For paperclip to handle images
  has_attached_file :image, styles: { large: "600x600#", medium: "300x300#", thumb: "100x100#" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  validates_presence_of :image # Ensures post must have images.

  def when(date)
    since = Time.now.to_i - date.to_i
    case
    when since < 60
      return "Less than a minute ago"
    when since < 3600
      hrs = since / 60
      message = hrs.to_s + " minute#{since < 2 ? "" : "s"}  ago"
      return message
    when since < 86400
      since /= 3600
      message = since.to_s + " hour#{since < 2 ? "" : "s"}  ago"
      return message
    when since < 2592000
      since /= 86400
      message = since.to_s + " day#{since < 2 ? "" : "s"} ago"
      return message
    else
      message = (Time.now - date).to_i.to_s + "on " + (date.strftime("%b %d. %Y - %H:%M:%S")).to_s
      return message
    end
  end

  def count_likes(likes)
    a = likes.split(',')
    a.delete("")
    a.count
  end

  def count_dislikes(dislikes)
    a = dislikes.split(',')
    a.delete("")
    a.count
  end

  def like(post_id, current)
    @post = Post.find(post_id)
    puts "Sherif1"
    puts @post
    likes = @post.likes
    puts "sherif2"
    puts likes
    likes = likes + current + ","
    puts "sherif3"
    puts likes
    @post.likes = likes
    puts "sherif4"
    puts @post.likes
    return @post.likes
  end

  def dislike(post_id)
  end
end
