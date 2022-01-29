var offsets = [
  0000,0250,0500,0750,
  1000,1250,1500,1750, // 8
  2000,2250,2500,2750,
  3000,3250,3500,3750, // 16
  4000,4250,4500,4750,
  5000,5250,5500,5750, // 24
  6000,6250,6500,6750,
  7000,7250,7500,7750, // 32
  8000,8250,8500,8750,
  9000,9250,9500,9750  // 40
];
var friendsOffset = offsets[35-Args.offset];
var step = 250;
var deletedFriendsIds = [];
var timebarier = API.utils.getServerTime() - 518400; // 6 days less

var friends = API.friends.get({ count: step, offset: friendsOffset, fields: "last_seen" }).items;
var i = 0;
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
