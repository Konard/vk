var currentUserId = API.users.get()[0].id;
var friendsOffset = 0;
var step = 5000;
var operations = 2;
var deletedFriendsIds = [];
while(friendsOffset < 10000)
{
  var friends = API.friends.get({ user_id: currentUserId, offset: friendsOffset, fields: "photo_50" });
  var photos = friends.items@.photo_50;
  var deactivatedIndex = photos.indexOf("https://vk.com/images/deactivated_50.png");
  while ((deactivatedIndex > 0) && (deletedFriendsIds.length < operations))
  {
    var userIdToDelete = friends.items[deactivatedIndex].id;
    deletedFriendsIds.push(userIdToDelete);
    API.friends.delete({ user_id: userIdToDelete });
    if(deletedFriendsIds.length >= operations) 
    {
      return "deleted friends: " + deletedFriendsIds;
    }
    friends.items = friends.items.slice(deactivatedIndex);
    photos = photos.slice(deactivatedIndex);
    deactivatedIndex = photos.indexOf("https://vk.com/images/deactivated_50.png");
  }
  friendsOffset = friendsOffset + step;
}
if(deletedFriendsIds.length <= 0) 
{
  return "no deactivated friends";
}
else
{
  return "deleted friends: " + deletedFriendsIds;
}
