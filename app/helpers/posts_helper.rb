module PostsHelper

  def get_current_blog(posts)
    posts = posts.sort_by { |date| date.created_at }
    return posts.last
  end

  def blog_date(blogs_date)
    parsed_date = "Date: #{blogs_date.to_time.strftime('%B %e, %Y at %l:%M %p')}"
    return parsed_date
  end

  def get_four_random_blogs(posts)
    blogs = {
      group_one: nil,
      group_two: nil
    }

    if posts.present?
      posts = posts.sort_by { |date| date.created_at }.to_a
      posts.pop
      posts = posts.shuffle
      # start with the second record in the array

      blogs.each { |key, _v| blogs[key] = posts.shift(2) }
    end
    return blogs
  end

end

