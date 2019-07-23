# Rails Exercise

## To add roles to a user

1.  Open the rails console with `rails c`
2.  Search for a user, e.g. u = User.first
3.  Update the user: u.update!(roles: [:super_admin, :editor])

## To install test data

1.  Run: `rails db:setup`
2.  Look at the db/seeds.rb file to see the users and data that will be created
