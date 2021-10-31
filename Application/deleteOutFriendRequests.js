var requests = API.friends.getRequests({ out: 1 }).items;
var i = 0;
while(i < requests.length)
{
  API.friends.delete({ user_id: requests[i] });
  i = i + 1;
}
return requests;
