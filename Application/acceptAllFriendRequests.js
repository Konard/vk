var requests = API.friends.getRequests().items;
var i = 0;
while(i < requests.length)
{
  API.friends.add({ user_id: requests[i] });
  i = i + 1;
}
return requests;
