# AutoRebuffer

Steps:
1. Create Account at https://buffer.com/developers/
2. Rename config.rb.sample and fill with your credential
3. Run bundle install
4. Set cron e.g per 8 AM and 13 PM = 0 8,13 * * * /usr/local/ruby /your_parent_dir/publisher.rb
5. Run rvm cron setup if you're using RVM