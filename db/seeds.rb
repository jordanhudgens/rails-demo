Category.create!(title: "Ruby on Rails")
Category.create!(title: "Development")
Category.create!(title: "Amber")
Category.create!(title: "JavaScript")

User.create!(email: "admin@example.com", password: "secret123", password_confirmation: "secret123", roles: [:super_admin])
User.create!(email: "editor@example.com", password: "secret123", password_confirmation: "secret123", roles: [:editor])
User.create!(email: "user@example.com", password: "secret123", password_confirmation: "secret123")

100.times do |i|
  Article.create!(
    title: "Article #{i}",
    content: "Maecenas faucibus mollis interdum. Donec id elit non mi porta gravida at eget metus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec id elit non mi porta gravida at eget metus. Curabitur blandit tempus porttitor. Morbi leo risus, porta ac consectetur ac, vestibulum at eros. Donec ullamcorper nulla non metus auctor fringilla. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec sed odio dui. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Nulla vitae elit libero, a pharetra augue.",
    category: Category.all.sample,
    user: User.all.sample
  )
end
