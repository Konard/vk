# vk
VK automation for personal auditory growth.

# Setup

1. Receive your token:

   https://oauth.vk.com/authorize?client_id=7907795&scope=friends&redirect_uri=https://oauth.vk.com/blank.html&display=page&response_type=token&revoke=1

   7907795 is an id of VK app where main logic is located.

   Token works for 24 hours, it has access only to `friends` API methods.
2. Put your token at `access-token` file with no additional whitespace.
