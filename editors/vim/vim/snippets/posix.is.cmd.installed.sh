# shell check to status if cmd is in PATH


# NOTE: replace `CMD` with binary to status

which CMD > /dev/null
# check if CMD is in PATH
if [ $? -eq 1 ]
then
  echo "CMD not found!"
  exit 2
fi
