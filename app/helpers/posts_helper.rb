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
    data = {
      :group_one => nil,
      :group_two => nil
    }

    blogs = {}

    if posts.present?
      posts = posts.sort_by { |date| date.created_at }.to_a
      posts.pop
      posts = posts.shuffle
      posts = posts.slice(1..4)
      posts = posts.shuffle

      # data.each do |key, value|
      #   posts.each_slice(2) do |value|
      #     data[key] = value
      #   end
      # end
      #refactor this so it makes more sense
      posts.each_slice(2).with_index do |value, index|
        blogs[index + 1] = value
      end
    end
    return blogs
  end

end

