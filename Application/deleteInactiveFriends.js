var friendsLimit = 10000;
var step = 23;
var timeDifference = 259200; // 3 days
var friend_id_barier = 10000000; // do not delete users with id less than this number
var friendsOffset = friendsLimit - step * (parseInt(Args.offset) + 1);
var friends = API.friends.get({ count: step, offset: friendsOffset, fields: "last_seen" }).items;
var time_barier = API.utils.getServerTime() - timeDifference;
var i = 0;
var deletedFriendsIds = [];
while(i < friends.length)
{
  var last_seen_time = friends[i].last_seen.time;
  if (last_seen_time != null && (last_seen_time > 0) && (last_seen_time <= time_barier) && (friends[i].id > friend_id_barier)) {
    API.friends.delete({ user_id: friends[i].id });
    deletedFriendsIds.push(friends[i].id);
  }
  i = i + 1;
}
return deletedFriendsIds;
