# Rails Exercise

## To add roles to a user

1.  Open the rails console with `rails c`
2.  Search for a user, e.g. u = User.first
3.  Update the user: u.update!(roles: [:super_admin, :editor])
