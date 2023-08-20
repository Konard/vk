var friendsOffset = 0;
var step = 5000;
var deactivatedValues = ["banned", "deleted"];
var i, deactivatedIndex, friendId;
var deletedFriendsIds = [];
while (friendsOffset < 10000)
{
  var friends = API.friends.get({ offset: friendsOffset, count: step, fields: "deactivated" }).items;
  var deactivatedField = friends@.deactivated;
  i = 0;
  while (i < deactivatedValues.length) 
  {
    deactivatedIndex = deactivatedField.indexOf(deactivatedValues[i]);
    if (deactivatedIndex > 0)
    {
      friendId = friends[deactivatedIndex].id;
      deletedFriendsIds.push(friendId);
      API.friends.delete({ user_id: friendId });
    }
    i = i + 1;
  }
  friendsOffset = friendsOffset + step;
}
return "deleted friends: [" + deletedFriendsIds + "]";
