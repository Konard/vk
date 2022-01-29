var friendsLimit = 10000;
var step = 150;
var friendsOffset = friendsLimit - step * (Args.offset + 1);
var timebarier = API.utils.getServerTime() - 518400; // 6 days less
var friends = API.friends.get({ count: step, offset: friendsOffset, fields: "last_seen" }).items;
var i = 0;
var deletedFriendsIds = [];
while(i < friends.length)
{
  var last_seen_time = friends[i].last_seen.time;
  if (last_seen_time != null && (last_seen_time > 0) && (last_seen_time <= timebarier) && (friends[i].id > 30000000)) {
    API.friends.delete({ user_id: friends[i].id });
    deletedFriendsIds.push(friends[i].id);
  }
  i = i + 1;
}
return deletedFriendsIds;
