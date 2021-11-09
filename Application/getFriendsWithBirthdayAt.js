var count = 250;
var friends = API.friends.get({ fields: "bdate", count: count, offset: count * Args.offset }).items;
var i = 0;
var result = [];
while(i < friends.length)
{
  if (friends[i].bdate != null && friends[i].bdate.indexOf(Args.date) == 0) {
    result.push({ friendId: friends[i].id, birthdayDate: friends[i].bdate });
  }
  i = i + 1;
}
return result;