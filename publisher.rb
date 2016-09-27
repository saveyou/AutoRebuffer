require 'buffer'
require './config'

client  = Buffer::Client.new(BUFFER_ACCESS_TOKEN)
updates = []
loop    = 2
processing  = true
lists   = []

while loop <= 10 && processing == true
  updates[loop] = client.updates_by_profile_id(BUFFER_PROFILE_ID, {status: 'sent', page: loop, count: 20, since: 1470640359})
  p "Processing Page " + loop.to_s
  updates[loop].updates.each do |u|
    if u.media && u.media.link
      lists.push({text:u.text,link:u.media.link})
    end
  end
  processing = false if !updates[loop].updates[0]
  loop += 1
end

if lists
  rand  = Random.new.rand(lists.count)
  new_post = lists[rand]
  p "Create New Update"
  p new_post
  client.create_update(
      body: {
          text: new_post[:text],
          profile_ids: [BUFFER_PROFILE_ID],
          media: {link: new_post[:link]},
          profile_service: 'facebook',
          now: 1
      }
  )
end

p "Done"