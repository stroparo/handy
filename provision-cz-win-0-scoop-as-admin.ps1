Set-ExecutionPolicy RemoteSigned -scope CurrentUser

# Older
# iwr -useb get.scoop.sh | iex

# Newer
irm get.scoop.sh | iex
