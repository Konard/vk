var friendsOffset = 0;
var step = 5000;
var operations = 2;
var deletedFriendsIds = [];
while(friendsOffset < 10000)
{
  var friends = API.friends.get({ offset: friendsOffset });
  var photos = friends.items@.deactivated;
  var deactivatedIndex = photos.indexOf("banned");
  deactivatedIndex = deactivatedIndex + photos.indexOf("deleted");
  while ((deactivatedIndex > 0) && (deletedFriendsIds.length < operations)){
    var userIdToDelete = friends.items[deactivatedIndex].id;
    if (friends.items@.deactivated){
      deletedFriendsIds.push(userIdToDelete);
      API.friends.delete({ user_id: userIdToDelete });
      if(deletedFriendsIds.length >= operations) {
        return "deleted friends: " + deletedFriendsIds;
      }
      photos = friends.items.slice(deactivatedIndex);
      photos = photos.slice(deactivatedIndex);
      friends.items = friends.items.slice(deactivatedIndex);
    }
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
