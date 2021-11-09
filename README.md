# vk
VK automation for personal auditory growth.

# Warnings

DO NOT TRUST THIS SOFTWARE.

READ THE CODE.

BE CAREFUL TO
NOT UPLOAD YOUR TOKENS OR CREDENTIALS
TO THE REPOSITORY/PULL REQUEST.
CHECK GITIGNORE FILE.

# Setup

1. Setup your own [backend application](Application/README.md).
2. Install selenium (for automatic token refreshing).
   ```
   npm install -g selenium-side-runner
   npm install -g chromedriver
   ```
3. Put your credentials in `email` and `pass` files (required to use automatic token refreshing).

# Use

1. Receive your token:

   https://oauth.vk.com/authorize?client_id=7907795&scope=friends&redirect_uri=https://oauth.vk.com/blank.html&display=page&response_type=token&revoke=1

   7907795 is an id of VK backend app where main logic is located.

   Token works for 24 hours, it has access only to `friends` API methods.
2. Put your token at `access-token` file with no additional whitespace.
