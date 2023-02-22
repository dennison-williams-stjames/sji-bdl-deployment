#continue
#read -r -d '' JSON <<- EJSON
cat << EJSON > /tmp/sji-bdl-createAppAdminUser.js
db.createCollection('admins');

db.admins.insert({
  email: "${BDL_USERNAME}",
  password: "${BDL_HASH}",
});
EJSON

"${mongo[@]}" "$MONGO_INITDB_DATABASE" /tmp/sji-bdl-createAppAdminUser.js
rm /tmp/sji-bdl-createAppAdminUser.js

